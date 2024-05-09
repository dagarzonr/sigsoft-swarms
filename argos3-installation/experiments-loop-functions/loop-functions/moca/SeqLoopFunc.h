/**
  * @file <loop-functions/example/PwLoopFunc.h>
  *
  * @author Antoine Ligot - <aligot@ulb.ac.be>
  *
  * @package ARGoS3-AutoMoDe
  *
  * @license MIT License
  */

#ifndef SEQ_LOOP_FUNC
#define SEQ_LOOP_FUNC

#include <argos3/core/simulator/space/space.h>
#include <argos3/plugins/robots/e-puck/simulator/epuck_entity.h>
#include <argos3/plugins/simulator/entities/box_entity.h>
#include <argos3/plugins/robots/arena/simulator/arena_entity.h>
#include "../../src/CoreLoopFunctions.h"

#include <stdio.h>
#include <stdlib.h>

using namespace argos;

class SeqLoopFunction: public CoreLoopFunctions {
  public:
    SeqLoopFunction();
    SeqLoopFunction(const SeqLoopFunction& orig);
    virtual ~SeqLoopFunction();

    virtual void Destroy();

    virtual argos::CColor GetFloorColor(const argos::CVector2& c_position_on_plane);
    virtual void PostExperiment();
    virtual void PostStep();
    virtual void Reset();
    virtual void Init(TConfigurationNode& t_tree);

    Real GetObjectiveFunction();

    CVector3 GetRandomPosition();
    CVector2 GetRandomArenaPoint();
    UInt32 GetRandomTime(UInt32 unMin, UInt32 unMax);

    void ArenaControl();
    bool SelectColorOrder(UInt32 un_ColorOrderParam);
    void AsignArenaColors(UInt32 un_NumberColorsParam);

    void InitRobotStates();
    void InitSources();
    void GetArenaPoints(UInt32 unNumberPoints);
    void UpdateRobotPositions();
    void UpdateRobotColors();

    bool IsRobotInDock (CVector2 tRobotPosition);
    bool IsRobotInNest (CVector2 tRobotPosition);
    bool IsRobotInSource (CVector2 tRobotPosition);
    UInt32 IsRobotInSourceID (CVector2 tRobotPosition);

    void ScoreControl();
    Real GetScore(UInt32 unTask);
    Real GetNormalizedScore(Real fScore, UInt32 unTask);
    Real GetStopScore();
    Real GetAllBlackScore();
    Real GetForageScore();
    Real GetMimicryScore();
    Real GetDistributeScore();
    Real GetAggregationScore();

    Real GetTransportScore();
    Real GetRechargeScore();
    Real GetManufactureScore();
    Real GetSurveillanceScore();
    Real GetRestoreScore();
    Real GetRefillScore();
    Real GetPickUpScore();
    Real GetDispersionScore();
    Real GetCleaningScore();
    void ExecuteRestore();

    Real GetColorStopScore();
    Real GetColorAllBlackScore();
    Real GetColorForageScore();
    Real GetColorAggregationScore();

  private:

    /*
     * Method used to create and distribute the Arena.
     */
    void PositionArena();

    /*
     * Method used to remove the arena from the arena.
     */
    void RemoveArena();

    /*
     * Method used to deternmine wheter a number is even.
     */
    bool IsEven(UInt32 unNumber);

    /*
     * Return the radious of the arena.
     */
    Real GetArenaRadious();

    /*
     * Build the arena with the arena_entity plugin.
     */
    bool m_bBuildArena;

    /*
     * The number of edges in the arena used in the experiment.
     */
    UInt32 m_unNumberEdges;

    /*
     * The number of boxes in each edge of the arena used in the experiment.
     */
    UInt32 m_unNumberBoxes;

    /*
     * The lenght of the boxes used in the experiment.
     */
    Real m_fLenghtBoxes;

    /*
     * The arena used in the experiment.
     */
    CArenaEntity* m_pcArena;

    /*
     * Transition time in sequence experiments
     */
    UInt32 m_unTrnTime;

    /*
     * Allows for score invertion in maximization algorithms.
     */
    bool m_bMaximization;

    /*
     * Transition time in sequence experiments
     */
    UInt32 m_unNumerColors;

    /*
     * Selector of the order of the color in the arena
     * (0:Random, 1:First Blue, 2: FirstRed)
     */
    UInt32 m_unColorOrder;

    /*
     * Selector of the task executed in blue arena
     */
    UInt32 m_unBlueTask;

    /*
     * Selector of the task executed in red arena
     */
    UInt32 m_unRedTask;

    /*
     * Task to be evaluated in sequence experiments
     * (0:Overall (TODO), 1: Blue, 2: Red)
     */
    UInt32 m_unEvalTask;

    /*
     * Alpha value for linearly combine the objetive functions
     * [0,2,4,5,6,8] --- But could be extended as Real
     */
    Real m_fAlphaValue;

    /*
     * Enables functions for real-robot experiments
     * 
     */
    bool m_bRealExperiments;

    std::string m_sBaseCommand;
    std::string m_sSufixCommand;

    UInt32 m_unClock;
    Real m_fObjectiveFunction;
    Real m_fObjectiveFunctionBlue;
    Real m_fObjectiveFunctionRed;
    Real m_bBlueFirst;
    CColor m_cArenaColor;
    CColor m_cTaskAsignedColorBlue;
    CColor m_cTaskEvalColorBlue;
    CColor m_cTaskAsignedColorRed;
    CColor m_cTaskEvalColorRed;

    struct RobotStateStruct {
        CVector2 cLastPosition;
        CVector2 cPosition;
        CColor cColor;
        bool bItem;
        bool bMaterial;
        bool bMoving;
    };

    typedef std::map<CEPuckEntity*, RobotStateStruct> TRobotStateMap;
    typedef std::map<UInt32, UInt32> TSourceItemsMap;
    typedef std::map<UInt32, UInt32> TSourceOperationMap;
    typedef std::map<UInt32, UInt32> TSourceRestoringMap;
    typedef std::vector<CVector2> TArenaPoints;

    TRobotStateMap m_tRobotStates;
    TSourceItemsMap m_tSourceItems;
    TSourceOperationMap m_tSourceOperation;
    TSourceOperationMap m_tSourceReparation;
    TSourceRestoringMap m_tSourceRestoring;
    TArenaPoints m_tArenaPoints;

    std::vector<UInt32> m_vArenaState;
    std::vector<UInt32> m_vArenaStatePast;

};

#endif
