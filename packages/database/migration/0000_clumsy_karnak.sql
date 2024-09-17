CREATE SCHEMA "core";
--> statement-breakpoint
CREATE SCHEMA "plugin";
--> statement-breakpoint
DO $$ BEGIN
 CREATE TYPE "public"."event_type" AS ENUM('PROCESS_CREATED', 'PROCESS_ACTIVATED', 'PROCESS_FINISHED', 'PROCESS_REACTIVATED', 'TASK_TOOK_OVER', 'TASK_HANDED_OVER', 'TASK_LEFT', 'TASK_SAVED', 'ACTION_EXECUTED', 'INVOLVED_USERS', 'TRANSFERED_TASK', 'FILES_UPLOADED');
EXCEPTION
 WHEN duplicate_object THEN null;
END $$;
--> statement-breakpoint
DO $$ BEGIN
 CREATE TYPE "public"."inputType" AS ENUM('SWITCH', 'TEXT', 'RADIO', 'CHECKLIST', 'FILE', 'DATE', 'DESCRIPTION', 'TEXTAREA');
EXCEPTION
 WHEN duplicate_object THEN null;
END $$;
--> statement-breakpoint
DO $$ BEGIN
 CREATE TYPE "public"."icon" AS ENUM('default', 'Ri24HoursFill', 'Ri24HoursLine', 'Ri4kFill', 'Ri4kLine', 'RiAB', 'RiAccountBoxFill', 'RiAccountBoxLine', 'RiAccountCircleFill', 'RiAccountCircleLine', 'RiAccountPinBoxFill', 'RiAccountPinBoxLine', 'RiAccountPinCircleFill', 'RiAccountPinCircleLine', 'RiAddBoxFill', 'RiAddBoxLine', 'RiAddCircleFill', 'RiAddCircleLine', 'RiAddFill', 'RiAddLargeFill', 'RiAddLargeLine', 'RiAddLine', 'RiAdminFill', 'RiAdminLine', 'RiAdvertisementFill', 'RiAdvertisementLine', 'RiAedElectrodesFill', 'RiAedElectrodesLine', 'RiAedFill', 'RiAedLine', 'RiAiGenerate', 'RiAirplayFill', 'RiAirplayLine', 'RiAlarmFill', 'RiAlarmLine', 'RiAlarmWarningFill', 'RiAlarmWarningLine', 'RiAlbumFill', 'RiAlbumLine', 'RiAlertFill', 'RiAlertLine', 'RiAlibabaCloudFill', 'RiAlibabaCloudLine', 'RiAliensFill', 'RiAliensLine', 'RiAlignBottom', 'RiAlignCenter', 'RiAlignItemBottomFill', 'RiAlignItemBottomLine', 'RiAlignItemHorizontalCenterFill', 'RiAlignItemHorizontalCenterLine', 'RiAlignItemLeftFill', 'RiAlignItemLeftLine', 'RiAlignItemRightFill', 'RiAlignItemRightLine', 'RiAlignItemTopFill', 'RiAlignItemTopLine', 'RiAlignItemVerticalCenterFill', 'RiAlignItemVerticalCenterLine', 'RiAlignJustify', 'RiAlignLeft', 'RiAlignRight', 'RiAlignTop', 'RiAlignVertically', 'RiAlipayFill', 'RiAlipayLine', 'RiAmazonFill', 'RiAmazonLine', 'RiAnchorFill', 'RiAnchorLine', 'RiAncientGateFill', 'RiAncientGateLine', 'RiAncientPavilionFill', 'RiAncientPavilionLine', 'RiAndroidFill', 'RiAndroidLine', 'RiAngularjsFill', 'RiAngularjsLine', 'RiAnticlockwise2Fill', 'RiAnticlockwise2Line', 'RiAnticlockwiseFill', 'RiAnticlockwiseLine', 'RiAppStoreFill', 'RiAppStoreLine', 'RiAppleFill', 'RiAppleLine', 'RiApps2AddFill', 'RiApps2AddLine', 'RiApps2Fill', 'RiApps2Line', 'RiAppsFill', 'RiAppsLine', 'RiArchive2Fill', 'RiArchive2Line', 'RiArchiveDrawerFill', 'RiArchiveDrawerLine', 'RiArchiveFill', 'RiArchiveLine', 'RiArchiveStackFill', 'RiArchiveStackLine', 'RiArmchairFill', 'RiArmchairLine', 'RiArrowDownCircleFill', 'RiArrowDownCircleLine', 'RiArrowDownDoubleFill', 'RiArrowDownDoubleLine', 'RiArrowDownFill', 'RiArrowDownLine', 'RiArrowDownSFill', 'RiArrowDownSLine', 'RiArrowDownWideFill', 'RiArrowDownWideLine', 'RiArrowDropDownFill', 'RiArrowDropDownLine', 'RiArrowDropLeftFill', 'RiArrowDropLeftLine', 'RiArrowDropRightFill', 'RiArrowDropRightLine', 'RiArrowDropUpFill', 'RiArrowDropUpLine', 'RiArrowGoBackFill', 'RiArrowGoBackLine', 'RiArrowGoForwardFill', 'RiArrowGoForwardLine', 'RiArrowLeftCircleFill', 'RiArrowLeftCircleLine', 'RiArrowLeftDoubleFill', 'RiArrowLeftDoubleLine', 'RiArrowLeftDownFill', 'RiArrowLeftDownLine', 'RiArrowLeftFill', 'RiArrowLeftLine', 'RiArrowLeftRightFill', 'RiArrowLeftRightLine', 'RiArrowLeftSFill', 'RiArrowLeftSLine', 'RiArrowLeftUpFill', 'RiArrowLeftUpLine', 'RiArrowLeftWideFill', 'RiArrowLeftWideLine', 'RiArrowRightCircleFill', 'RiArrowRightCircleLine', 'RiArrowRightDoubleFill', 'RiArrowRightDoubleLine', 'RiArrowRightDownFill', 'RiArrowRightDownLine', 'RiArrowRightFill', 'RiArrowRightLine', 'RiArrowRightSFill', 'RiArrowRightSLine', 'RiArrowRightUpFill', 'RiArrowRightUpLine', 'RiArrowRightWideFill', 'RiArrowRightWideLine', 'RiArrowTurnBackFill', 'RiArrowTurnBackLine', 'RiArrowTurnForwardFill', 'RiArrowTurnForwardLine', 'RiArrowUpCircleFill', 'RiArrowUpCircleLine', 'RiArrowUpDoubleFill', 'RiArrowUpDoubleLine', 'RiArrowUpDownFill', 'RiArrowUpDownLine', 'RiArrowUpFill', 'RiArrowUpLine', 'RiArrowUpSFill', 'RiArrowUpSLine', 'RiArrowUpWideFill', 'RiArrowUpWideLine', 'RiArtboard2Fill', 'RiArtboard2Line', 'RiArtboardFill', 'RiArtboardLine', 'RiArticleFill', 'RiArticleLine', 'RiAspectRatioFill', 'RiAspectRatioLine', 'RiAsterisk', 'RiAtFill', 'RiAtLine', 'RiAttachment2', 'RiAttachmentFill', 'RiAttachmentLine', 'RiAuctionFill', 'RiAuctionLine', 'RiAwardFill', 'RiAwardLine', 'RiBaiduFill', 'RiBaiduLine', 'RiBallPenFill', 'RiBallPenLine', 'RiBankCard2Fill', 'RiBankCard2Line', 'RiBankCardFill', 'RiBankCardLine', 'RiBankFill', 'RiBankLine', 'RiBarChart2Fill', 'RiBarChart2Line', 'RiBarChartBoxFill', 'RiBarChartBoxLine', 'RiBarChartFill', 'RiBarChartGroupedFill', 'RiBarChartGroupedLine', 'RiBarChartHorizontalFill', 'RiBarChartHorizontalLine', 'RiBarChartLine', 'RiBarcodeBoxFill', 'RiBarcodeBoxLine', 'RiBarcodeFill', 'RiBarcodeLine', 'RiBardFill', 'RiBardLine', 'RiBarricadeFill', 'RiBarricadeLine', 'RiBaseStationFill', 'RiBaseStationLine', 'RiBasketballFill', 'RiBasketballLine', 'RiBattery2ChargeFill', 'RiBattery2ChargeLine', 'RiBattery2Fill', 'RiBattery2Line', 'RiBatteryChargeFill', 'RiBatteryChargeLine', 'RiBatteryFill', 'RiBatteryLine', 'RiBatteryLowFill', 'RiBatteryLowLine', 'RiBatterySaverFill', 'RiBatterySaverLine', 'RiBatteryShareFill', 'RiBatteryShareLine', 'RiBearSmileFill', 'RiBearSmileLine', 'RiBeerFill', 'RiBeerLine', 'RiBehanceFill', 'RiBehanceLine', 'RiBellFill', 'RiBellLine', 'RiBikeFill', 'RiBikeLine', 'RiBilibiliFill', 'RiBilibiliLine', 'RiBillFill', 'RiBillLine', 'RiBilliardsFill', 'RiBilliardsLine', 'RiBitCoinFill', 'RiBitCoinLine', 'RiBlazeFill', 'RiBlazeLine', 'RiBlenderFill', 'RiBlenderLine', 'RiBloggerFill', 'RiBloggerLine', 'RiBlueskyFill', 'RiBlueskyLine', 'RiBluetoothConnectFill', 'RiBluetoothConnectLine', 'RiBluetoothFill', 'RiBluetoothLine', 'RiBlurOffFill', 'RiBlurOffLine', 'RiBnbFill', 'RiBnbLine', 'RiBodyScanFill', 'RiBodyScanLine', 'RiBold', 'RiBook2Fill', 'RiBook2Line', 'RiBook3Fill', 'RiBook3Line', 'RiBookFill', 'RiBookLine', 'RiBookMarkedFill', 'RiBookMarkedLine', 'RiBookOpenFill', 'RiBookOpenLine', 'RiBookReadFill', 'RiBookReadLine', 'RiBookletFill', 'RiBookletLine', 'RiBookmark2Fill', 'RiBookmark2Line', 'RiBookmark3Fill', 'RiBookmark3Line', 'RiBookmarkFill', 'RiBookmarkLine', 'RiBootstrapFill', 'RiBootstrapLine', 'RiBowlFill', 'RiBowlLine', 'RiBox1Fill', 'RiBox1Line', 'RiBox2Fill', 'RiBox2Line', 'RiBox3Fill', 'RiBox3Line', 'RiBoxingFill', 'RiBoxingLine', 'RiBracesFill', 'RiBracesLine', 'RiBracketsFill', 'RiBracketsLine', 'RiBrainFill', 'RiBrainLine', 'RiBreadFill', 'RiBreadLine', 'RiBriefcase2Fill', 'RiBriefcase2Line', 'RiBriefcase3Fill', 'RiBriefcase3Line', 'RiBriefcase4Fill', 'RiBriefcase4Line', 'RiBriefcase5Fill', 'RiBriefcase5Line', 'RiBriefcaseFill', 'RiBriefcaseLine', 'RiBringForward', 'RiBringToFront', 'RiBroadcastFill', 'RiBroadcastLine', 'RiBrush2Fill', 'RiBrush2Line', 'RiBrush3Fill', 'RiBrush3Line', 'RiBrush4Fill', 'RiBrush4Line', 'RiBrushFill', 'RiBrushLine', 'RiBtcFill', 'RiBtcLine', 'RiBubbleChartFill', 'RiBubbleChartLine', 'RiBug2Fill', 'RiBug2Line', 'RiBugFill', 'RiBugLine', 'RiBuilding2Fill', 'RiBuilding2Line', 'RiBuilding3Fill', 'RiBuilding3Line', 'RiBuilding4Fill', 'RiBuilding4Line', 'RiBuildingFill', 'RiBuildingLine', 'RiBus2Fill', 'RiBus2Line', 'RiBusFill', 'RiBusLine', 'RiBusWifiFill', 'RiBusWifiLine', 'RiCactusFill', 'RiCactusLine', 'RiCake2Fill', 'RiCake2Line', 'RiCake3Fill', 'RiCake3Line', 'RiCakeFill', 'RiCakeLine', 'RiCalculatorFill', 'RiCalculatorLine', 'RiCalendar2Fill', 'RiCalendar2Line', 'RiCalendarCheckFill', 'RiCalendarCheckLine', 'RiCalendarCloseFill', 'RiCalendarCloseLine', 'RiCalendarEventFill', 'RiCalendarEventLine', 'RiCalendarFill', 'RiCalendarLine', 'RiCalendarScheduleFill', 'RiCalendarScheduleLine', 'RiCalendarTodoFill', 'RiCalendarTodoLine', 'RiCalendarView', 'RiCamera2Fill', 'RiCamera2Line', 'RiCamera3Fill', 'RiCamera3Line', 'RiCameraFill', 'RiCameraLensFill', 'RiCameraLensLine', 'RiCameraLine', 'RiCameraOffFill', 'RiCameraOffLine', 'RiCameraSwitchFill', 'RiCameraSwitchLine', 'RiCandleFill', 'RiCandleLine', 'RiCapsuleFill', 'RiCapsuleLine', 'RiCarFill', 'RiCarLine', 'RiCarWashingFill', 'RiCarWashingLine', 'RiCaravanFill', 'RiCaravanLine', 'RiCarouselView', 'RiCashFill', 'RiCashLine', 'RiCastFill', 'RiCastLine', 'RiCellphoneFill', 'RiCellphoneLine', 'RiCelsiusFill', 'RiCelsiusLine', 'RiCentosFill', 'RiCentosLine', 'RiCharacterRecognitionFill', 'RiCharacterRecognitionLine', 'RiChargingPile2Fill', 'RiChargingPile2Line', 'RiChargingPileFill', 'RiChargingPileLine', 'RiChat1Fill', 'RiChat1Line', 'RiChat2Fill', 'RiChat2Line', 'RiChat3Fill', 'RiChat3Line', 'RiChat4Fill', 'RiChat4Line', 'RiChatCheckFill', 'RiChatCheckLine', 'RiChatDeleteFill', 'RiChatDeleteLine', 'RiChatDownloadFill', 'RiChatDownloadLine', 'RiChatFollowUpFill', 'RiChatFollowUpLine', 'RiChatForwardFill', 'RiChatForwardLine', 'RiChatHeartFill', 'RiChatHeartLine', 'RiChatHistoryFill', 'RiChatHistoryLine', 'RiChatNewFill', 'RiChatNewLine', 'RiChatOffFill', 'RiChatOffLine', 'RiChatPollFill', 'RiChatPollLine', 'RiChatPrivateFill', 'RiChatPrivateLine', 'RiChatQuoteFill', 'RiChatQuoteLine', 'RiChatSettingsFill', 'RiChatSettingsLine', 'RiChatSmile2Fill', 'RiChatSmile2Line', 'RiChatSmile3Fill', 'RiChatSmile3Line', 'RiChatSmileFill', 'RiChatSmileLine', 'RiChatThreadFill', 'RiChatThreadLine', 'RiChatUploadFill', 'RiChatUploadLine', 'RiChatVoiceFill', 'RiChatVoiceLine', 'RiCheckDoubleFill', 'RiCheckDoubleLine', 'RiCheckFill', 'RiCheckLine', 'RiCheckboxBlankCircleFill', 'RiCheckboxBlankCircleLine', 'RiCheckboxBlankFill', 'RiCheckboxBlankLine', 'RiCheckboxCircleFill', 'RiCheckboxCircleLine', 'RiCheckboxFill', 'RiCheckboxIndeterminateFill', 'RiCheckboxIndeterminateLine', 'RiCheckboxLine', 'RiCheckboxMultipleBlankFill', 'RiCheckboxMultipleBlankLine', 'RiCheckboxMultipleFill', 'RiCheckboxMultipleLine', 'RiChinaRailwayFill', 'RiChinaRailwayLine', 'RiChromeFill', 'RiChromeLine', 'RiCircleFill', 'RiCircleLine', 'RiClapperboardFill', 'RiClapperboardLine', 'RiClipboardFill', 'RiClipboardLine', 'RiClockwise2Fill', 'RiClockwise2Line', 'RiClockwiseFill', 'RiClockwiseLine', 'RiCloseCircleFill', 'RiCloseCircleLine', 'RiCloseFill', 'RiCloseLargeFill', 'RiCloseLargeLine', 'RiCloseLine', 'RiClosedCaptioningFill', 'RiClosedCaptioningLine', 'RiCloudFill', 'RiCloudLine', 'RiCloudOffFill', 'RiCloudOffLine', 'RiCloudWindyFill', 'RiCloudWindyLine', 'RiCloudy2Fill', 'RiCloudy2Line', 'RiCloudyFill', 'RiCloudyLine', 'RiCodeBlock', 'RiCodeBoxFill', 'RiCodeBoxLine', 'RiCodeFill', 'RiCodeLine', 'RiCodeSFill', 'RiCodeSLine', 'RiCodeSSlashFill', 'RiCodeSSlashLine', 'RiCodeView', 'RiCodepenFill', 'RiCodepenLine', 'RiCoinFill', 'RiCoinLine', 'RiCoinsFill', 'RiCoinsLine', 'RiCollageFill', 'RiCollageLine', 'RiCollapseDiagonal2Fill', 'RiCollapseDiagonal2Line', 'RiCollapseDiagonalFill', 'RiCollapseDiagonalLine', 'RiColorFilterFill', 'RiColorFilterLine', 'RiCommandFill', 'RiCommandLine', 'RiCommunityFill', 'RiCommunityLine', 'RiCompass2Fill', 'RiCompass2Line', 'RiCompass3Fill', 'RiCompass3Line', 'RiCompass4Fill', 'RiCompass4Line', 'RiCompassDiscoverFill', 'RiCompassDiscoverLine', 'RiCompassFill', 'RiCompassLine', 'RiCompasses2Fill', 'RiCompasses2Line', 'RiCompassesFill', 'RiCompassesLine', 'RiComputerFill', 'RiComputerLine', 'RiContactsBook2Fill', 'RiContactsBook2Line', 'RiContactsBook3Fill', 'RiContactsBook3Line', 'RiContactsBookFill', 'RiContactsBookLine', 'RiContactsBookUploadFill', 'RiContactsBookUploadLine', 'RiContactsFill', 'RiContactsLine', 'RiContractFill', 'RiContractLeftFill', 'RiContractLeftLine', 'RiContractLeftRightFill', 'RiContractLeftRightLine', 'RiContractLine', 'RiContractRightFill', 'RiContractRightLine', 'RiContractUpDownFill', 'RiContractUpDownLine', 'RiContrast2Fill', 'RiContrast2Line', 'RiContrastDrop2Fill', 'RiContrastDrop2Line', 'RiContrastDropFill', 'RiContrastDropLine', 'RiContrastFill', 'RiContrastLine', 'RiCopilotFill', 'RiCopilotLine', 'RiCopperCoinFill', 'RiCopperCoinLine', 'RiCopperDiamondFill', 'RiCopperDiamondLine', 'RiCopyleftFill', 'RiCopyleftLine', 'RiCopyrightFill', 'RiCopyrightLine', 'RiCoreosFill', 'RiCoreosLine', 'RiCornerDownLeftFill', 'RiCornerDownLeftLine', 'RiCornerDownRightFill', 'RiCornerDownRightLine', 'RiCornerLeftDownFill', 'RiCornerLeftDownLine', 'RiCornerLeftUpFill', 'RiCornerLeftUpLine', 'RiCornerRightDownFill', 'RiCornerRightDownLine', 'RiCornerRightUpFill', 'RiCornerRightUpLine', 'RiCornerUpLeftDoubleFill', 'RiCornerUpLeftDoubleLine', 'RiCornerUpLeftFill', 'RiCornerUpLeftLine', 'RiCornerUpRightDoubleFill', 'RiCornerUpRightDoubleLine', 'RiCornerUpRightFill', 'RiCornerUpRightLine', 'RiCoupon2Fill', 'RiCoupon2Line', 'RiCoupon3Fill', 'RiCoupon3Line', 'RiCoupon4Fill', 'RiCoupon4Line', 'RiCoupon5Fill', 'RiCoupon5Line', 'RiCouponFill', 'RiCouponLine', 'RiCpuFill', 'RiCpuLine', 'RiCreativeCommonsByFill', 'RiCreativeCommonsByLine', 'RiCreativeCommonsFill', 'RiCreativeCommonsLine', 'RiCreativeCommonsNcFill', 'RiCreativeCommonsNcLine', 'RiCreativeCommonsNdFill', 'RiCreativeCommonsNdLine', 'RiCreativeCommonsSaFill', 'RiCreativeCommonsSaLine', 'RiCreativeCommonsZeroFill', 'RiCreativeCommonsZeroLine', 'RiCriminalFill', 'RiCriminalLine', 'RiCrop2Fill', 'RiCrop2Line', 'RiCropFill', 'RiCropLine', 'RiCrossFill', 'RiCrossLine', 'RiCrosshair2Fill', 'RiCrosshair2Line', 'RiCrosshairFill', 'RiCrosshairLine', 'RiCss3Fill', 'RiCss3Line', 'RiCupFill', 'RiCupLine', 'RiCurrencyFill', 'RiCurrencyLine', 'RiCursorFill', 'RiCursorLine', 'RiCustomerService2Fill', 'RiCustomerService2Line', 'RiCustomerServiceFill', 'RiCustomerServiceLine', 'RiDashboard2Fill', 'RiDashboard2Line', 'RiDashboard3Fill', 'RiDashboard3Line', 'RiDashboardFill', 'RiDashboardHorizontalFill', 'RiDashboardHorizontalLine', 'RiDashboardLine', 'RiDatabase2Fill', 'RiDatabase2Line', 'RiDatabaseFill', 'RiDatabaseLine', 'RiDeleteBack2Fill', 'RiDeleteBack2Line', 'RiDeleteBackFill', 'RiDeleteBackLine', 'RiDeleteBin2Fill', 'RiDeleteBin2Line', 'RiDeleteBin3Fill', 'RiDeleteBin3Line', 'RiDeleteBin4Fill', 'RiDeleteBin4Line', 'RiDeleteBin5Fill', 'RiDeleteBin5Line', 'RiDeleteBin6Fill', 'RiDeleteBin6Line', 'RiDeleteBin7Fill', 'RiDeleteBin7Line', 'RiDeleteBinFill', 'RiDeleteBinLine', 'RiDeleteColumn', 'RiDeleteRow', 'RiDeviceFill', 'RiDeviceLine', 'RiDeviceRecoverFill', 'RiDeviceRecoverLine', 'RiDice1Fill', 'RiDice1Line', 'RiDice2Fill', 'RiDice2Line', 'RiDice3Fill', 'RiDice3Line', 'RiDice4Fill', 'RiDice4Line', 'RiDice5Fill', 'RiDice5Line', 'RiDice6Fill', 'RiDice6Line', 'RiDiceFill', 'RiDiceLine', 'RiDingdingFill', 'RiDingdingLine', 'RiDirectionFill', 'RiDirectionLine', 'RiDiscFill', 'RiDiscLine', 'RiDiscordFill', 'RiDiscordLine', 'RiDiscountPercentFill', 'RiDiscountPercentLine', 'RiDiscussFill', 'RiDiscussLine', 'RiDislikeFill', 'RiDislikeLine', 'RiDisqusFill', 'RiDisqusLine', 'RiDivideFill', 'RiDivideLine', 'RiDonutChartFill', 'RiDonutChartLine', 'RiDoorClosedFill', 'RiDoorClosedLine', 'RiDoorFill', 'RiDoorLine', 'RiDoorLockBoxFill', 'RiDoorLockBoxLine', 'RiDoorLockFill', 'RiDoorLockLine', 'RiDoorOpenFill', 'RiDoorOpenLine', 'RiDossierFill', 'RiDossierLine', 'RiDoubanFill', 'RiDoubanLine', 'RiDoubleQuotesL', 'RiDoubleQuotesR', 'RiDownload2Fill', 'RiDownload2Line', 'RiDownloadCloud2Fill', 'RiDownloadCloud2Line', 'RiDownloadCloudFill', 'RiDownloadCloudLine', 'RiDownloadFill', 'RiDownloadLine', 'RiDraftFill', 'RiDraftLine', 'RiDragDropFill', 'RiDragDropLine', 'RiDragMove2Fill', 'RiDragMove2Line', 'RiDragMoveFill', 'RiDragMoveLine', 'RiDraggable', 'RiDribbbleFill', 'RiDribbbleLine', 'RiDrinks2Fill', 'RiDrinks2Line', 'RiDrinksFill', 'RiDrinksLine', 'RiDriveFill', 'RiDriveLine', 'RiDrizzleFill', 'RiDrizzleLine', 'RiDropFill', 'RiDropLine', 'RiDropboxFill', 'RiDropboxLine', 'RiDropdownList', 'RiDualSim1Fill', 'RiDualSim1Line', 'RiDualSim2Fill', 'RiDualSim2Line', 'RiDvFill', 'RiDvLine', 'RiDvdFill', 'RiDvdLine', 'RiEBike2Fill', 'RiEBike2Line', 'RiEBikeFill', 'RiEBikeLine', 'RiEarthFill', 'RiEarthLine', 'RiEarthquakeFill', 'RiEarthquakeLine', 'RiEdgeFill', 'RiEdgeLine', 'RiEdgeNewFill', 'RiEdgeNewLine', 'RiEdit2Fill', 'RiEdit2Line', 'RiEditBoxFill', 'RiEditBoxLine', 'RiEditCircleFill', 'RiEditCircleLine', 'RiEditFill', 'RiEditLine', 'RiEjectFill', 'RiEjectLine', 'RiEmojiStickerFill', 'RiEmojiStickerLine', 'RiEmotion2Fill', 'RiEmotion2Line', 'RiEmotionFill', 'RiEmotionHappyFill', 'RiEmotionHappyLine', 'RiEmotionLaughFill', 'RiEmotionLaughLine', 'RiEmotionLine', 'RiEmotionNormalFill', 'RiEmotionNormalLine', 'RiEmotionSadFill', 'RiEmotionSadLine', 'RiEmotionUnhappyFill', 'RiEmotionUnhappyLine', 'RiEmpathizeFill', 'RiEmpathizeLine', 'RiEmphasis', 'RiEmphasisCn', 'RiEnglishInput', 'RiEqualFill', 'RiEqualLine', 'RiEqualizer2Fill', 'RiEqualizer2Line', 'RiEqualizer3Fill', 'RiEqualizer3Line', 'RiEqualizerFill', 'RiEqualizerLine', 'RiEraserFill', 'RiEraserLine', 'RiErrorWarningFill', 'RiErrorWarningLine', 'RiEthFill', 'RiEthLine', 'RiEvernoteFill', 'RiEvernoteLine', 'RiExchange2Fill', 'RiExchange2Line', 'RiExchangeBoxFill', 'RiExchangeBoxLine', 'RiExchangeCnyFill', 'RiExchangeCnyLine', 'RiExchangeDollarFill', 'RiExchangeDollarLine', 'RiExchangeFill', 'RiExchangeFundsFill', 'RiExchangeFundsLine', 'RiExchangeLine', 'RiExpandDiagonal2Fill', 'RiExpandDiagonal2Line', 'RiExpandDiagonalFill', 'RiExpandDiagonalLine', 'RiExpandHeightFill', 'RiExpandHeightLine', 'RiExpandLeftFill', 'RiExpandLeftLine', 'RiExpandLeftRightFill', 'RiExpandLeftRightLine', 'RiExpandRightFill', 'RiExpandRightLine', 'RiExpandUpDownFill', 'RiExpandUpDownLine', 'RiExpandWidthFill', 'RiExpandWidthLine', 'RiExportFill', 'RiExportLine', 'RiExternalLinkFill', 'RiExternalLinkLine', 'RiEye2Fill', 'RiEye2Line', 'RiEyeCloseFill', 'RiEyeCloseLine', 'RiEyeFill', 'RiEyeLine', 'RiEyeOffFill', 'RiEyeOffLine', 'RiFacebookBoxFill', 'RiFacebookBoxLine', 'RiFacebookCircleFill', 'RiFacebookCircleLine', 'RiFacebookFill', 'RiFacebookLine', 'RiFahrenheitFill', 'RiFahrenheitLine', 'RiFeedbackFill', 'RiFeedbackLine', 'RiFile2Fill', 'RiFile2Line', 'RiFile3Fill', 'RiFile3Line', 'RiFile4Fill', 'RiFile4Line', 'RiFileAddFill', 'RiFileAddLine', 'RiFileChart2Fill', 'RiFileChart2Line', 'RiFileChartFill', 'RiFileChartLine', 'RiFileCheckFill', 'RiFileCheckLine', 'RiFileCloseFill', 'RiFileCloseLine', 'RiFileCloudFill', 'RiFileCloudLine', 'RiFileCodeFill', 'RiFileCodeLine', 'RiFileCopy2Fill', 'RiFileCopy2Line', 'RiFileCopyFill', 'RiFileCopyLine', 'RiFileDamageFill', 'RiFileDamageLine', 'RiFileDownloadFill', 'RiFileDownloadLine', 'RiFileEditFill', 'RiFileEditLine', 'RiFileExcel2Fill', 'RiFileExcel2Line', 'RiFileExcelFill', 'RiFileExcelLine', 'RiFileFill', 'RiFileForbidFill', 'RiFileForbidLine', 'RiFileGifFill', 'RiFileGifLine', 'RiFileHistoryFill', 'RiFileHistoryLine', 'RiFileHwpFill', 'RiFileHwpLine', 'RiFileImageFill', 'RiFileImageLine', 'RiFileInfoFill', 'RiFileInfoLine', 'RiFileLine', 'RiFileList2Fill', 'RiFileList2Line', 'RiFileList3Fill', 'RiFileList3Line', 'RiFileListFill', 'RiFileListLine', 'RiFileLockFill', 'RiFileLockLine', 'RiFileMarkedFill', 'RiFileMarkedLine', 'RiFileMusicFill', 'RiFileMusicLine', 'RiFilePaper2Fill', 'RiFilePaper2Line', 'RiFilePaperFill', 'RiFilePaperLine', 'RiFilePdf2Fill', 'RiFilePdf2Line', 'RiFilePdfFill', 'RiFilePdfLine', 'RiFilePpt2Fill', 'RiFilePpt2Line', 'RiFilePptFill', 'RiFilePptLine', 'RiFileReduceFill', 'RiFileReduceLine', 'RiFileSearchFill', 'RiFileSearchLine', 'RiFileSettingsFill', 'RiFileSettingsLine', 'RiFileShield2Fill', 'RiFileShield2Line', 'RiFileShieldFill', 'RiFileShieldLine', 'RiFileShredFill', 'RiFileShredLine', 'RiFileTextFill', 'RiFileTextLine', 'RiFileTransferFill', 'RiFileTransferLine', 'RiFileUnknowFill', 'RiFileUnknowLine', 'RiFileUploadFill', 'RiFileUploadLine', 'RiFileUserFill', 'RiFileUserLine', 'RiFileVideoFill', 'RiFileVideoLine', 'RiFileWarningFill', 'RiFileWarningLine', 'RiFileWord2Fill', 'RiFileWord2Line', 'RiFileWordFill', 'RiFileWordLine', 'RiFileZipFill', 'RiFileZipLine', 'RiFilmFill', 'RiFilmLine', 'RiFilter2Fill', 'RiFilter2Line', 'RiFilter3Fill', 'RiFilter3Line', 'RiFilterFill', 'RiFilterLine', 'RiFilterOffFill', 'RiFilterOffLine', 'RiFindReplaceFill', 'RiFindReplaceLine', 'RiFinderFill', 'RiFinderLine', 'RiFingerprint2Fill', 'RiFingerprint2Line', 'RiFingerprintFill', 'RiFingerprintLine', 'RiFireFill', 'RiFireLine', 'RiFirebaseFill', 'RiFirebaseLine', 'RiFirefoxFill', 'RiFirefoxLine', 'RiFirstAidKitFill', 'RiFirstAidKitLine', 'RiFlag2Fill', 'RiFlag2Line', 'RiFlagFill', 'RiFlagLine', 'RiFlashlightFill', 'RiFlashlightLine', 'RiFlaskFill', 'RiFlaskLine', 'RiFlickrFill', 'RiFlickrLine', 'RiFlightLandFill', 'RiFlightLandLine', 'RiFlightTakeoffFill', 'RiFlightTakeoffLine', 'RiFlipHorizontal2Fill', 'RiFlipHorizontal2Line', 'RiFlipHorizontalFill', 'RiFlipHorizontalLine', 'RiFlipVertical2Fill', 'RiFlipVertical2Line', 'RiFlipVerticalFill', 'RiFlipVerticalLine', 'RiFloodFill', 'RiFloodLine', 'RiFlowChart', 'RiFlowerFill', 'RiFlowerLine', 'RiFlutterFill', 'RiFlutterLine', 'RiFocus2Fill', 'RiFocus2Line', 'RiFocus3Fill', 'RiFocus3Line', 'RiFocusFill', 'RiFocusLine', 'RiFocusMode', 'RiFoggyFill', 'RiFoggyLine', 'RiFolder2Fill', 'RiFolder2Line', 'RiFolder3Fill', 'RiFolder3Line', 'RiFolder4Fill', 'RiFolder4Line', 'RiFolder5Fill', 'RiFolder5Line', 'RiFolder6Fill', 'RiFolder6Line', 'RiFolderAddFill', 'RiFolderAddLine', 'RiFolderChart2Fill', 'RiFolderChart2Line', 'RiFolderChartFill', 'RiFolderChartLine', 'RiFolderCheckFill', 'RiFolderCheckLine', 'RiFolderCloseFill', 'RiFolderCloseLine', 'RiFolderCloudFill', 'RiFolderCloudLine', 'RiFolderDownloadFill', 'RiFolderDownloadLine', 'RiFolderFill', 'RiFolderForbidFill', 'RiFolderForbidLine', 'RiFolderHistoryFill', 'RiFolderHistoryLine', 'RiFolderImageFill', 'RiFolderImageLine', 'RiFolderInfoFill', 'RiFolderInfoLine', 'RiFolderKeyholeFill', 'RiFolderKeyholeLine', 'RiFolderLine', 'RiFolderLockFill', 'RiFolderLockLine', 'RiFolderMusicFill', 'RiFolderMusicLine', 'RiFolderOpenFill', 'RiFolderOpenLine', 'RiFolderReceivedFill', 'RiFolderReceivedLine', 'RiFolderReduceFill', 'RiFolderReduceLine', 'RiFolderSettingsFill', 'RiFolderSettingsLine', 'RiFolderSharedFill', 'RiFolderSharedLine', 'RiFolderShield2Fill', 'RiFolderShield2Line', 'RiFolderShieldFill', 'RiFolderShieldLine', 'RiFolderTransferFill', 'RiFolderTransferLine', 'RiFolderUnknowFill', 'RiFolderUnknowLine', 'RiFolderUploadFill', 'RiFolderUploadLine', 'RiFolderUserFill', 'RiFolderUserLine', 'RiFolderVideoFill', 'RiFolderVideoLine', 'RiFolderWarningFill', 'RiFolderWarningLine', 'RiFolderZipFill', 'RiFolderZipLine', 'RiFoldersFill', 'RiFoldersLine', 'RiFontColor', 'RiFontFamily', 'RiFontMono', 'RiFontSans', 'RiFontSansSerif', 'RiFontSize', 'RiFontSize2', 'RiFootballFill', 'RiFootballLine', 'RiFootprintFill', 'RiFootprintLine', 'RiForbid2Fill', 'RiForbid2Line', 'RiForbidFill', 'RiForbidLine', 'RiFormatClear', 'RiFormula', 'RiForward10Fill', 'RiForward10Line', 'RiForward15Fill', 'RiForward15Line', 'RiForward30Fill', 'RiForward30Line', 'RiForward5Fill', 'RiForward5Line', 'RiForwardEndFill', 'RiForwardEndLine', 'RiForwardEndMiniFill', 'RiForwardEndMiniLine', 'RiFridgeFill', 'RiFridgeLine', 'RiFriendicaFill', 'RiFriendicaLine', 'RiFullscreenExitFill', 'RiFullscreenExitLine', 'RiFullscreenFill', 'RiFullscreenLine', 'RiFunctionAddFill', 'RiFunctionAddLine', 'RiFunctionFill', 'RiFunctionLine', 'RiFunctions', 'RiFundsBoxFill', 'RiFundsBoxLine', 'RiFundsFill', 'RiFundsLine', 'RiGalleryFill', 'RiGalleryLine', 'RiGalleryUploadFill', 'RiGalleryUploadLine', 'RiGalleryView', 'RiGalleryView2', 'RiGameFill', 'RiGameLine', 'RiGamepadFill', 'RiGamepadLine', 'RiGasStationFill', 'RiGasStationLine', 'RiGatsbyFill', 'RiGatsbyLine', 'RiGenderlessFill', 'RiGenderlessLine', 'RiGhost2Fill', 'RiGhost2Line', 'RiGhostFill', 'RiGhostLine', 'RiGhostSmileFill', 'RiGhostSmileLine', 'RiGift2Fill', 'RiGift2Line', 'RiGiftFill', 'RiGiftLine', 'RiGitBranchFill', 'RiGitBranchLine', 'RiGitClosePullRequestFill', 'RiGitClosePullRequestLine', 'RiGitCommitFill', 'RiGitCommitLine', 'RiGitForkFill', 'RiGitForkLine', 'RiGitMergeFill', 'RiGitMergeLine', 'RiGitPrDraftFill', 'RiGitPrDraftLine', 'RiGitPullRequestFill', 'RiGitPullRequestLine', 'RiGitRepositoryCommitsFill', 'RiGitRepositoryCommitsLine', 'RiGitRepositoryFill', 'RiGitRepositoryLine', 'RiGitRepositoryPrivateFill', 'RiGitRepositoryPrivateLine', 'RiGithubFill', 'RiGithubLine', 'RiGitlabFill', 'RiGitlabLine', 'RiGlasses2Fill', 'RiGlasses2Line', 'RiGlassesFill', 'RiGlassesLine', 'RiGlobalFill', 'RiGlobalLine', 'RiGlobeFill', 'RiGlobeLine', 'RiGoblet2Fill', 'RiGoblet2Line', 'RiGobletFill', 'RiGobletLine', 'RiGogglesFill', 'RiGogglesLine', 'RiGolfBallFill', 'RiGolfBallLine', 'RiGoogleFill', 'RiGoogleLine', 'RiGooglePlayFill', 'RiGooglePlayLine', 'RiGovernmentFill', 'RiGovernmentLine', 'RiGpsFill', 'RiGpsLine', 'RiGradienterFill', 'RiGradienterLine', 'RiGraduationCapFill', 'RiGraduationCapLine', 'RiGridFill', 'RiGridLine', 'RiGroup2Fill', 'RiGroup2Line', 'RiGroup3Fill', 'RiGroup3Line', 'RiGroupFill', 'RiGroupLine', 'RiGuideFill', 'RiGuideLine', 'RiH1', 'RiH2', 'RiH3', 'RiH4', 'RiH5', 'RiH6', 'RiHailFill', 'RiHailLine', 'RiHammerFill', 'RiHammerLine', 'RiHand', 'RiHandCoinFill', 'RiHandCoinLine', 'RiHandHeartFill', 'RiHandHeartLine', 'RiHandSanitizerFill', 'RiHandSanitizerLine', 'RiHandbagFill', 'RiHandbagLine', 'RiHardDrive2Fill', 'RiHardDrive2Line', 'RiHardDrive3Fill', 'RiHardDrive3Line', 'RiHardDriveFill', 'RiHardDriveLine', 'RiHashtag', 'RiHaze2Fill', 'RiHaze2Line', 'RiHazeFill', 'RiHazeLine', 'RiHdFill', 'RiHdLine', 'RiHeading', 'RiHeadphoneFill', 'RiHeadphoneLine', 'RiHealthBookFill', 'RiHealthBookLine', 'RiHeart2Fill', 'RiHeart2Line', 'RiHeart3Fill', 'RiHeart3Line', 'RiHeartAdd2Fill', 'RiHeartAdd2Line', 'RiHeartAddFill', 'RiHeartAddLine', 'RiHeartFill', 'RiHeartLine', 'RiHeartPulseFill', 'RiHeartPulseLine', 'RiHeartsFill', 'RiHeartsLine', 'RiHeavyShowersFill', 'RiHeavyShowersLine', 'RiHexagonFill', 'RiHexagonLine', 'RiHistoryFill', 'RiHistoryLine', 'RiHome2Fill', 'RiHome2Line', 'RiHome3Fill', 'RiHome3Line', 'RiHome4Fill', 'RiHome4Line', 'RiHome5Fill', 'RiHome5Line', 'RiHome6Fill', 'RiHome6Line', 'RiHome7Fill', 'RiHome7Line', 'RiHome8Fill', 'RiHome8Line', 'RiHomeFill', 'RiHomeGearFill', 'RiHomeGearLine', 'RiHomeHeartFill', 'RiHomeHeartLine', 'RiHomeLine', 'RiHomeOfficeFill', 'RiHomeOfficeLine', 'RiHomeSmile2Fill', 'RiHomeSmile2Line', 'RiHomeSmileFill', 'RiHomeSmileLine', 'RiHomeWifiFill', 'RiHomeWifiLine', 'RiHonorOfKingsFill', 'RiHonorOfKingsLine', 'RiHonourFill', 'RiHonourLine', 'RiHospitalFill', 'RiHospitalLine', 'RiHotelBedFill', 'RiHotelBedLine', 'RiHotelFill', 'RiHotelLine', 'RiHotspotFill', 'RiHotspotLine', 'RiHourglass2Fill', 'RiHourglass2Line', 'RiHourglassFill', 'RiHourglassLine', 'RiHqFill', 'RiHqLine', 'RiHtml5Fill', 'RiHtml5Line', 'RiIdCardFill', 'RiIdCardLine', 'RiIeFill', 'RiIeLine', 'RiImage2Fill', 'RiImage2Line', 'RiImageAddFill', 'RiImageAddLine', 'RiImageCircleFill', 'RiImageCircleLine', 'RiImageEditFill', 'RiImageEditLine', 'RiImageFill', 'RiImageLine', 'RiImportFill', 'RiImportLine', 'RiInbox2Fill', 'RiInbox2Line', 'RiInboxArchiveFill', 'RiInboxArchiveLine', 'RiInboxFill', 'RiInboxLine', 'RiInboxUnarchiveFill', 'RiInboxUnarchiveLine', 'RiIncreaseDecreaseFill', 'RiIncreaseDecreaseLine', 'RiIndentDecrease', 'RiIndentIncrease', 'RiIndeterminateCircleFill', 'RiIndeterminateCircleLine', 'RiInfinityFill', 'RiInfinityLine', 'RiInfoI', 'RiInformation2Fill', 'RiInformation2Line', 'RiInformationFill', 'RiInformationLine', 'RiInformationOffFill', 'RiInformationOffLine', 'RiInfraredThermometerFill', 'RiInfraredThermometerLine', 'RiInkBottleFill', 'RiInkBottleLine', 'RiInputCursorMove', 'RiInputField', 'RiInputMethodFill', 'RiInputMethodLine', 'RiInsertColumnLeft', 'RiInsertColumnRight', 'RiInsertRowBottom', 'RiInsertRowTop', 'RiInstagramFill', 'RiInstagramLine', 'RiInstallFill', 'RiInstallLine', 'RiInstanceFill', 'RiInstanceLine', 'RiInvisionFill', 'RiInvisionLine', 'RiItalic', 'RiJavaFill', 'RiJavaLine', 'RiJavascriptFill', 'RiJavascriptLine', 'RiKakaoTalkFill', 'RiKakaoTalkLine', 'RiKanbanView', 'RiKanbanView2', 'RiKey2Fill', 'RiKey2Line', 'RiKeyFill', 'RiKeyLine', 'RiKeyboardBoxFill', 'RiKeyboardBoxLine', 'RiKeyboardFill', 'RiKeyboardLine', 'RiKeynoteFill', 'RiKeynoteLine', 'RiKickFill', 'RiKickLine', 'RiKnifeBloodFill', 'RiKnifeBloodLine', 'RiKnifeFill', 'RiKnifeLine', 'RiLandscapeFill', 'RiLandscapeLine', 'RiLayout2Fill', 'RiLayout2Line', 'RiLayout3Fill', 'RiLayout3Line', 'RiLayout4Fill', 'RiLayout4Line', 'RiLayout5Fill', 'RiLayout5Line', 'RiLayout6Fill', 'RiLayout6Line', 'RiLayoutBottom2Fill', 'RiLayoutBottom2Line', 'RiLayoutBottomFill', 'RiLayoutBottomLine', 'RiLayoutColumnFill', 'RiLayoutColumnLine', 'RiLayoutFill', 'RiLayoutGrid2Fill', 'RiLayoutGrid2Line', 'RiLayoutGridFill', 'RiLayoutGridLine', 'RiLayoutHorizontalFill', 'RiLayoutHorizontalLine', 'RiLayoutLeft2Fill', 'RiLayoutLeft2Line', 'RiLayoutLeftFill', 'RiLayoutLeftLine', 'RiLayoutLine', 'RiLayoutMasonryFill', 'RiLayoutMasonryLine', 'RiLayoutRight2Fill', 'RiLayoutRight2Line', 'RiLayoutRightFill', 'RiLayoutRightLine', 'RiLayoutRowFill', 'RiLayoutRowLine', 'RiLayoutTop2Fill', 'RiLayoutTop2Line', 'RiLayoutTopFill', 'RiLayoutTopLine', 'RiLayoutVerticalFill', 'RiLayoutVerticalLine', 'RiLeafFill', 'RiLeafLine', 'RiLifebuoyFill', 'RiLifebuoyLine', 'RiLightbulbFill', 'RiLightbulbFlashFill', 'RiLightbulbFlashLine', 'RiLightbulbLine', 'RiLineChartFill', 'RiLineChartLine', 'RiLineFill', 'RiLineHeight', 'RiLineLine', 'RiLink', 'RiLinkM', 'RiLinkUnlink', 'RiLinkUnlinkM', 'RiLinkedinBoxFill', 'RiLinkedinBoxLine', 'RiLinkedinFill', 'RiLinkedinLine', 'RiLinksFill', 'RiLinksLine', 'RiListCheck', 'RiListCheck2', 'RiListCheck3', 'RiListIndefinite', 'RiListOrdered', 'RiListOrdered2', 'RiListRadio', 'RiListSettingsFill', 'RiListSettingsLine', 'RiListUnordered', 'RiListView', 'RiLiveFill', 'RiLiveLine', 'RiLoader2Fill', 'RiLoader2Line', 'RiLoader3Fill', 'RiLoader3Line', 'RiLoader4Fill', 'RiLoader4Line', 'RiLoader5Fill', 'RiLoader5Line', 'RiLoaderFill', 'RiLoaderLine', 'RiLock2Fill', 'RiLock2Line', 'RiLockFill', 'RiLockLine', 'RiLockPasswordFill', 'RiLockPasswordLine', 'RiLockStarFill', 'RiLockStarLine', 'RiLockUnlockFill', 'RiLockUnlockLine', 'RiLoginBoxFill', 'RiLoginBoxLine', 'RiLoginCircleFill', 'RiLoginCircleLine', 'RiLogoutBoxFill', 'RiLogoutBoxLine', 'RiLogoutBoxRFill', 'RiLogoutBoxRLine', 'RiLogoutCircleFill', 'RiLogoutCircleLine', 'RiLogoutCircleRFill', 'RiLogoutCircleRLine', 'RiLoopLeftFill', 'RiLoopLeftLine', 'RiLoopRightFill', 'RiLoopRightLine', 'RiLuggageCartFill', 'RiLuggageCartLine', 'RiLuggageDepositFill', 'RiLuggageDepositLine', 'RiLungsFill', 'RiLungsLine', 'RiMacFill', 'RiMacLine', 'RiMacbookFill', 'RiMacbookLine', 'RiMagicFill', 'RiMagicLine', 'RiMailAddFill', 'RiMailAddLine', 'RiMailCheckFill', 'RiMailCheckLine', 'RiMailCloseFill', 'RiMailCloseLine', 'RiMailDownloadFill', 'RiMailDownloadLine', 'RiMailFill', 'RiMailForbidFill', 'RiMailForbidLine', 'RiMailLine', 'RiMailLockFill', 'RiMailLockLine', 'RiMailOpenFill', 'RiMailOpenLine', 'RiMailSendFill', 'RiMailSendLine', 'RiMailSettingsFill', 'RiMailSettingsLine', 'RiMailStarFill', 'RiMailStarLine', 'RiMailUnreadFill', 'RiMailUnreadLine', 'RiMailVolumeFill', 'RiMailVolumeLine', 'RiMap2Fill', 'RiMap2Line', 'RiMapFill', 'RiMapLine', 'RiMapPin2Fill', 'RiMapPin2Line', 'RiMapPin3Fill', 'RiMapPin3Line', 'RiMapPin4Fill', 'RiMapPin4Line', 'RiMapPin5Fill', 'RiMapPin5Line', 'RiMapPinAddFill', 'RiMapPinAddLine', 'RiMapPinFill', 'RiMapPinLine', 'RiMapPinRangeFill', 'RiMapPinRangeLine', 'RiMapPinTimeFill', 'RiMapPinTimeLine', 'RiMapPinUserFill', 'RiMapPinUserLine', 'RiMarkPenFill', 'RiMarkPenLine', 'RiMarkdownFill', 'RiMarkdownLine', 'RiMarkupFill', 'RiMarkupLine', 'RiMastercardFill', 'RiMastercardLine', 'RiMastodonFill', 'RiMastodonLine', 'RiMedal2Fill', 'RiMedal2Line', 'RiMedalFill', 'RiMedalLine', 'RiMedicineBottleFill', 'RiMedicineBottleLine', 'RiMediumFill', 'RiMediumLine', 'RiMegaphoneFill', 'RiMegaphoneLine', 'RiMemoriesFill', 'RiMemoriesLine', 'RiMenFill', 'RiMenLine', 'RiMentalHealthFill', 'RiMentalHealthLine', 'RiMenu2Fill', 'RiMenu2Line', 'RiMenu3Fill', 'RiMenu3Line', 'RiMenu4Fill', 'RiMenu4Line', 'RiMenu5Fill', 'RiMenu5Line', 'RiMenuAddFill', 'RiMenuAddLine', 'RiMenuFill', 'RiMenuFold2Fill', 'RiMenuFold2Line', 'RiMenuFold3Fill', 'RiMenuFold3Line', 'RiMenuFold4Fill', 'RiMenuFold4Line', 'RiMenuFoldFill', 'RiMenuFoldLine', 'RiMenuLine', 'RiMenuSearchFill', 'RiMenuSearchLine', 'RiMenuUnfold2Fill', 'RiMenuUnfold2Line', 'RiMenuUnfold3Fill', 'RiMenuUnfold3Line', 'RiMenuUnfold4Fill', 'RiMenuUnfold4Line', 'RiMenuUnfoldFill', 'RiMenuUnfoldLine', 'RiMergeCellsHorizontal', 'RiMergeCellsVertical', 'RiMessage2Fill', 'RiMessage2Line', 'RiMessage3Fill', 'RiMessage3Line', 'RiMessageFill', 'RiMessageLine', 'RiMessengerFill', 'RiMessengerLine', 'RiMetaFill', 'RiMetaLine', 'RiMeteorFill', 'RiMeteorLine', 'RiMic2Fill', 'RiMic2Line', 'RiMicFill', 'RiMicLine', 'RiMicOffFill', 'RiMicOffLine', 'RiMickeyFill', 'RiMickeyLine', 'RiMicroscopeFill', 'RiMicroscopeLine', 'RiMicrosoftFill', 'RiMicrosoftLine', 'RiMicrosoftLoopFill', 'RiMicrosoftLoopLine', 'RiMindMap', 'RiMiniProgramFill', 'RiMiniProgramLine', 'RiMistFill', 'RiMistLine', 'RiMobileDownloadFill', 'RiMobileDownloadLine', 'RiMoneyCnyBoxFill', 'RiMoneyCnyBoxLine', 'RiMoneyCnyCircleFill', 'RiMoneyCnyCircleLine', 'RiMoneyDollarBoxFill', 'RiMoneyDollarBoxLine', 'RiMoneyDollarCircleFill', 'RiMoneyDollarCircleLine', 'RiMoneyEuroBoxFill', 'RiMoneyEuroBoxLine', 'RiMoneyEuroCircleFill', 'RiMoneyEuroCircleLine', 'RiMoneyPoundBoxFill', 'RiMoneyPoundBoxLine', 'RiMoneyPoundCircleFill', 'RiMoneyPoundCircleLine', 'RiMoneyRupeeCircleFill', 'RiMoneyRupeeCircleLine', 'RiMoonClearFill', 'RiMoonClearLine', 'RiMoonCloudyFill', 'RiMoonCloudyLine', 'RiMoonFill', 'RiMoonFoggyFill', 'RiMoonFoggyLine', 'RiMoonLine', 'RiMore2Fill', 'RiMore2Line', 'RiMoreFill', 'RiMoreLine', 'RiMotorbikeFill', 'RiMotorbikeLine', 'RiMouseFill', 'RiMouseLine', 'RiMovie2Fill', 'RiMovie2Line', 'RiMovieFill', 'RiMovieLine', 'RiMusic2Fill', 'RiMusic2Line', 'RiMusicFill', 'RiMusicLine', 'RiMvFill', 'RiMvLine', 'RiNavigationFill', 'RiNavigationLine', 'RiNeteaseCloudMusicFill', 'RiNeteaseCloudMusicLine', 'RiNetflixFill', 'RiNetflixLine', 'RiNewsFill', 'RiNewsLine', 'RiNewspaperFill', 'RiNewspaperLine', 'RiNextjsFill', 'RiNextjsLine', 'RiNftFill', 'RiNftLine', 'RiNodeTree', 'RiNodejsFill', 'RiNodejsLine', 'RiNotification2Fill', 'RiNotification2Line', 'RiNotification3Fill', 'RiNotification3Line', 'RiNotification4Fill', 'RiNotification4Line', 'RiNotificationBadgeFill', 'RiNotificationBadgeLine', 'RiNotificationFill', 'RiNotificationLine', 'RiNotificationOffFill', 'RiNotificationOffLine', 'RiNotionFill', 'RiNotionLine', 'RiNpmjsFill', 'RiNpmjsLine', 'RiNumber0', 'RiNumber1', 'RiNumber2', 'RiNumber3', 'RiNumber4', 'RiNumber5', 'RiNumber6', 'RiNumber7', 'RiNumber8', 'RiNumber9', 'RiNumbersFill', 'RiNumbersLine', 'RiNurseFill', 'RiNurseLine', 'RiOctagonFill', 'RiOctagonLine', 'RiOilFill', 'RiOilLine', 'RiOmega', 'RiOpenArmFill', 'RiOpenArmLine', 'RiOpenSourceFill', 'RiOpenSourceLine', 'RiOpenaiFill', 'RiOpenaiLine', 'RiOpenbaseFill', 'RiOpenbaseLine', 'RiOperaFill', 'RiOperaLine', 'RiOrderPlayFill', 'RiOrderPlayLine', 'RiOrganizationChart', 'RiOutlet2Fill', 'RiOutlet2Line', 'RiOutletFill', 'RiOutletLine', 'RiOverline', 'RiP2pFill', 'RiP2pLine', 'RiPageSeparator', 'RiPagesFill', 'RiPagesLine', 'RiPaintBrushFill', 'RiPaintBrushLine', 'RiPaintFill', 'RiPaintLine', 'RiPaletteFill', 'RiPaletteLine', 'RiPantoneFill', 'RiPantoneLine', 'RiParagraph', 'RiParentFill', 'RiParentLine', 'RiParenthesesFill', 'RiParenthesesLine', 'RiParkingBoxFill', 'RiParkingBoxLine', 'RiParkingFill', 'RiParkingLine', 'RiPassExpiredFill', 'RiPassExpiredLine', 'RiPassPendingFill', 'RiPassPendingLine', 'RiPassValidFill', 'RiPassValidLine', 'RiPassportFill', 'RiPassportLine', 'RiPatreonFill', 'RiPatreonLine', 'RiPauseCircleFill', 'RiPauseCircleLine', 'RiPauseFill', 'RiPauseLargeFill', 'RiPauseLargeLine', 'RiPauseLine', 'RiPauseMiniFill', 'RiPauseMiniLine', 'RiPaypalFill', 'RiPaypalLine', 'RiPenNibFill', 'RiPenNibLine', 'RiPencilFill', 'RiPencilLine', 'RiPencilRuler2Fill', 'RiPencilRuler2Line', 'RiPencilRulerFill', 'RiPencilRulerLine', 'RiPentagonFill', 'RiPentagonLine', 'RiPercentFill', 'RiPercentLine', 'RiPhoneCameraFill', 'RiPhoneCameraLine', 'RiPhoneFill', 'RiPhoneFindFill', 'RiPhoneFindLine', 'RiPhoneLine', 'RiPhoneLockFill', 'RiPhoneLockLine', 'RiPictureInPicture2Fill', 'RiPictureInPicture2Line', 'RiPictureInPictureExitFill', 'RiPictureInPictureExitLine', 'RiPictureInPictureFill', 'RiPictureInPictureLine', 'RiPieChart2Fill', 'RiPieChart2Line', 'RiPieChartBoxFill', 'RiPieChartBoxLine', 'RiPieChartFill', 'RiPieChartLine', 'RiPinDistanceFill', 'RiPinDistanceLine', 'RiPingPongFill', 'RiPingPongLine', 'RiPinterestFill', 'RiPinterestLine', 'RiPinyinInput', 'RiPixelfedFill', 'RiPixelfedLine', 'RiPlaneFill', 'RiPlaneLine', 'RiPlanetFill', 'RiPlanetLine', 'RiPlantFill', 'RiPlantLine', 'RiPlayCircleFill', 'RiPlayCircleLine', 'RiPlayFill', 'RiPlayLargeFill', 'RiPlayLargeLine', 'RiPlayLine', 'RiPlayList2Fill', 'RiPlayList2Line', 'RiPlayListAddFill', 'RiPlayListAddLine', 'RiPlayListFill', 'RiPlayListLine', 'RiPlayMiniFill', 'RiPlayMiniLine', 'RiPlayReverseFill', 'RiPlayReverseLargeFill', 'RiPlayReverseLargeLine', 'RiPlayReverseLine', 'RiPlayReverseMiniFill', 'RiPlayReverseMiniLine', 'RiPlaystationFill', 'RiPlaystationLine', 'RiPlug2Fill', 'RiPlug2Line', 'RiPlugFill', 'RiPlugLine', 'RiPolaroid2Fill', 'RiPolaroid2Line', 'RiPolaroidFill', 'RiPolaroidLine', 'RiPoliceBadgeFill', 'RiPoliceBadgeLine', 'RiPoliceCarFill', 'RiPoliceCarLine', 'RiPresentationFill', 'RiPresentationLine', 'RiPriceTag2Fill', 'RiPriceTag2Line', 'RiPriceTag3Fill', 'RiPriceTag3Line', 'RiPriceTagFill', 'RiPriceTagLine', 'RiPrinterCloudFill', 'RiPrinterCloudLine', 'RiPrinterFill', 'RiPrinterLine', 'RiProductHuntFill', 'RiProductHuntLine', 'RiProfileFill', 'RiProfileLine', 'RiProgress1Fill', 'RiProgress1Line', 'RiProgress2Fill', 'RiProgress2Line', 'RiProgress3Fill', 'RiProgress3Line', 'RiProgress4Fill', 'RiProgress4Line', 'RiProgress5Fill', 'RiProgress5Line', 'RiProgress6Fill', 'RiProgress6Line', 'RiProgress7Fill', 'RiProgress7Line', 'RiProgress8Fill', 'RiProgress8Line', 'RiProhibited2Fill', 'RiProhibited2Line', 'RiProhibitedFill', 'RiProhibitedLine', 'RiProjector2Fill', 'RiProjector2Line', 'RiProjectorFill', 'RiProjectorLine', 'RiPsychotherapyFill', 'RiPsychotherapyLine', 'RiPulseFill', 'RiPulseLine', 'RiPushpin2Fill', 'RiPushpin2Line', 'RiPushpinFill', 'RiPushpinLine', 'RiPuzzle2Fill', 'RiPuzzle2Line', 'RiPuzzleFill', 'RiPuzzleLine', 'RiQqFill', 'RiQqLine', 'RiQrCodeFill', 'RiQrCodeLine', 'RiQrScan2Fill', 'RiQrScan2Line', 'RiQrScanFill', 'RiQrScanLine', 'RiQuestionAnswerFill', 'RiQuestionAnswerLine', 'RiQuestionFill', 'RiQuestionLine', 'RiQuestionMark', 'RiQuestionnaireFill', 'RiQuestionnaireLine', 'RiQuillPenFill', 'RiQuillPenLine', 'RiQuoteText', 'RiRadarFill', 'RiRadarLine', 'RiRadio2Fill', 'RiRadio2Line', 'RiRadioButtonFill', 'RiRadioButtonLine', 'RiRadioFill', 'RiRadioLine', 'RiRainbowFill', 'RiRainbowLine', 'RiRainyFill', 'RiRainyLine', 'RiRam2Fill', 'RiRam2Line', 'RiRamFill', 'RiRamLine', 'RiReactjsFill', 'RiReactjsLine', 'RiReceiptFill', 'RiReceiptLine', 'RiRecordCircleFill', 'RiRecordCircleLine', 'RiRecordMailFill', 'RiRecordMailLine', 'RiRectangleFill', 'RiRectangleLine', 'RiRecycleFill', 'RiRecycleLine', 'RiRedPacketFill', 'RiRedPacketLine', 'RiRedditFill', 'RiRedditLine', 'RiRefreshFill', 'RiRefreshLine', 'RiRefund2Fill', 'RiRefund2Line', 'RiRefundFill', 'RiRefundLine', 'RiRegisteredFill', 'RiRegisteredLine', 'RiRemixRunFill', 'RiRemixRunLine', 'RiRemixiconFill', 'RiRemixiconLine', 'RiRemoteControl2Fill', 'RiRemoteControl2Line', 'RiRemoteControlFill', 'RiRemoteControlLine', 'RiRepeat2Fill', 'RiRepeat2Line', 'RiRepeatFill', 'RiRepeatLine', 'RiRepeatOneFill', 'RiRepeatOneLine', 'RiReplay10Fill', 'RiReplay10Line', 'RiReplay15Fill', 'RiReplay15Line', 'RiReplay30Fill', 'RiReplay30Line', 'RiReplay5Fill', 'RiReplay5Line', 'RiReplyAllFill', 'RiReplyAllLine', 'RiReplyFill', 'RiReplyLine', 'RiReservedFill', 'RiReservedLine', 'RiRestTimeFill', 'RiRestTimeLine', 'RiRestartFill', 'RiRestartLine', 'RiRestaurant2Fill', 'RiRestaurant2Line', 'RiRestaurantFill', 'RiRestaurantLine', 'RiRewindFill', 'RiRewindLine', 'RiRewindMiniFill', 'RiRewindMiniLine', 'RiRewindStartFill', 'RiRewindStartLine', 'RiRewindStartMiniFill', 'RiRewindStartMiniLine', 'RiRfidFill', 'RiRfidLine', 'RiRhythmFill', 'RiRhythmLine', 'RiRidingFill', 'RiRidingLine', 'RiRoadMapFill', 'RiRoadMapLine', 'RiRoadsterFill', 'RiRoadsterLine', 'RiRobot2Fill', 'RiRobot2Line', 'RiRobot3Fill', 'RiRobot3Line', 'RiRobotFill', 'RiRobotLine', 'RiRocket2Fill', 'RiRocket2Line', 'RiRocketFill', 'RiRocketLine', 'RiRotateLockFill', 'RiRotateLockLine', 'RiRoundedCorner', 'RiRouteFill', 'RiRouteLine', 'RiRouterFill', 'RiRouterLine', 'RiRssFill', 'RiRssLine', 'RiRuler2Fill', 'RiRuler2Line', 'RiRulerFill', 'RiRulerLine', 'RiRunFill', 'RiRunLine', 'RiSafariFill', 'RiSafariLine', 'RiSafe2Fill', 'RiSafe2Line', 'RiSafeFill', 'RiSafeLine', 'RiSailboatFill', 'RiSailboatLine', 'RiSave2Fill', 'RiSave2Line', 'RiSave3Fill', 'RiSave3Line', 'RiSaveFill', 'RiSaveLine', 'RiScales2Fill', 'RiScales2Line', 'RiScales3Fill', 'RiScales3Line', 'RiScalesFill', 'RiScalesLine', 'RiScan2Fill', 'RiScan2Line', 'RiScanFill', 'RiScanLine', 'RiSchoolFill', 'RiSchoolLine', 'RiScissors2Fill', 'RiScissors2Line', 'RiScissorsCutFill', 'RiScissorsCutLine', 'RiScissorsFill', 'RiScissorsLine', 'RiScreenshot2Fill', 'RiScreenshot2Line', 'RiScreenshotFill', 'RiScreenshotLine', 'RiScrollToBottomFill', 'RiScrollToBottomLine', 'RiSdCardFill', 'RiSdCardLine', 'RiSdCardMiniFill', 'RiSdCardMiniLine', 'RiSearch2Fill', 'RiSearch2Line', 'RiSearchEyeFill', 'RiSearchEyeLine', 'RiSearchFill', 'RiSearchLine', 'RiSecurePaymentFill', 'RiSecurePaymentLine', 'RiSeedlingFill', 'RiSeedlingLine', 'RiSendBackward', 'RiSendPlane2Fill', 'RiSendPlane2Line', 'RiSendPlaneFill', 'RiSendPlaneLine', 'RiSendToBack', 'RiSensorFill', 'RiSensorLine', 'RiSeoFill', 'RiSeoLine', 'RiSeparator', 'RiServerFill', 'RiServerLine', 'RiServiceFill', 'RiServiceLine', 'RiSettings2Fill', 'RiSettings2Line', 'RiSettings3Fill', 'RiSettings3Line', 'RiSettings4Fill', 'RiSettings4Line', 'RiSettings5Fill', 'RiSettings5Line', 'RiSettings6Fill', 'RiSettings6Line', 'RiSettingsFill', 'RiSettingsLine', 'RiShadowFill', 'RiShadowLine', 'RiShakeHandsFill', 'RiShakeHandsLine', 'RiShape2Fill', 'RiShape2Line', 'RiShapeFill', 'RiShapeLine', 'RiShapesFill', 'RiShapesLine', 'RiShare2Fill', 'RiShare2Line', 'RiShareBoxFill', 'RiShareBoxLine', 'RiShareCircleFill', 'RiShareCircleLine', 'RiShareFill', 'RiShareForward2Fill', 'RiShareForward2Line', 'RiShareForwardBoxFill', 'RiShareForwardBoxLine', 'RiShareForwardFill', 'RiShareForwardLine', 'RiShareLine', 'RiShieldCheckFill', 'RiShieldCheckLine', 'RiShieldCrossFill', 'RiShieldCrossLine', 'RiShieldFill', 'RiShieldFlashFill', 'RiShieldFlashLine', 'RiShieldKeyholeFill', 'RiShieldKeyholeLine', 'RiShieldLine', 'RiShieldStarFill', 'RiShieldStarLine', 'RiShieldUserFill', 'RiShieldUserLine', 'RiShining2Fill', 'RiShining2Line', 'RiShiningFill', 'RiShiningLine', 'RiShip2Fill', 'RiShip2Line', 'RiShipFill', 'RiShipLine', 'RiShirtFill', 'RiShirtLine', 'RiShoppingBag2Fill', 'RiShoppingBag2Line', 'RiShoppingBag3Fill', 'RiShoppingBag3Line', 'RiShoppingBag4Fill', 'RiShoppingBag4Line', 'RiShoppingBagFill', 'RiShoppingBagLine', 'RiShoppingBasket2Fill', 'RiShoppingBasket2Line', 'RiShoppingBasketFill', 'RiShoppingBasketLine', 'RiShoppingCart2Fill', 'RiShoppingCart2Line', 'RiShoppingCartFill', 'RiShoppingCartLine', 'RiShowersFill', 'RiShowersLine', 'RiShuffleFill', 'RiShuffleLine', 'RiShutDownFill', 'RiShutDownLine', 'RiSideBarFill', 'RiSideBarLine', 'RiSidebarFoldFill', 'RiSidebarFoldLine', 'RiSidebarUnfoldFill', 'RiSidebarUnfoldLine', 'RiSignalTowerFill', 'RiSignalTowerLine', 'RiSignalWifi1Fill', 'RiSignalWifi1Line', 'RiSignalWifi2Fill', 'RiSignalWifi2Line', 'RiSignalWifi3Fill', 'RiSignalWifi3Line', 'RiSignalWifiErrorFill', 'RiSignalWifiErrorLine', 'RiSignalWifiFill', 'RiSignalWifiLine', 'RiSignalWifiOffFill', 'RiSignalWifiOffLine', 'RiSignpostFill', 'RiSignpostLine', 'RiSimCard2Fill', 'RiSimCard2Line', 'RiSimCardFill', 'RiSimCardLine', 'RiSingleQuotesL', 'RiSingleQuotesR', 'RiSipFill', 'RiSipLine', 'RiSketching', 'RiSkipBackFill', 'RiSkipBackLine', 'RiSkipBackMiniFill', 'RiSkipBackMiniLine', 'RiSkipDownFill', 'RiSkipDownLine', 'RiSkipForwardFill', 'RiSkipForwardLine', 'RiSkipForwardMiniFill', 'RiSkipForwardMiniLine', 'RiSkipLeftFill', 'RiSkipLeftLine', 'RiSkipRightFill', 'RiSkipRightLine', 'RiSkipUpFill', 'RiSkipUpLine', 'RiSkull2Fill', 'RiSkull2Line', 'RiSkullFill', 'RiSkullLine', 'RiSkypeFill', 'RiSkypeLine', 'RiSlackFill', 'RiSlackLine', 'RiSlashCommands', 'RiSlashCommands2', 'RiSliceFill', 'RiSliceLine', 'RiSlideshow2Fill', 'RiSlideshow2Line', 'RiSlideshow3Fill', 'RiSlideshow3Line', 'RiSlideshow4Fill', 'RiSlideshow4Line', 'RiSlideshowFill', 'RiSlideshowLine', 'RiSlideshowView', 'RiSlowDownFill', 'RiSlowDownLine', 'RiSmartphoneFill', 'RiSmartphoneLine', 'RiSnapchatFill', 'RiSnapchatLine', 'RiSnowflakeFill', 'RiSnowflakeLine', 'RiSnowyFill', 'RiSnowyLine', 'RiSofaFill', 'RiSofaLine', 'RiSortAlphabetAsc', 'RiSortAlphabetDesc', 'RiSortAsc', 'RiSortDesc', 'RiSortNumberAsc', 'RiSortNumberDesc', 'RiSoundModuleFill', 'RiSoundModuleLine', 'RiSoundcloudFill', 'RiSoundcloudLine', 'RiSpace', 'RiSpaceShipFill', 'RiSpaceShipLine', 'RiSpam2Fill', 'RiSpam2Line', 'RiSpam3Fill', 'RiSpam3Line', 'RiSpamFill', 'RiSpamLine', 'RiSparkling2Fill', 'RiSparkling2Line', 'RiSparklingFill', 'RiSparklingLine', 'RiSpeakFill', 'RiSpeakLine', 'RiSpeaker2Fill', 'RiSpeaker2Line', 'RiSpeaker3Fill', 'RiSpeaker3Line', 'RiSpeakerFill', 'RiSpeakerLine', 'RiSpectrumFill', 'RiSpectrumLine', 'RiSpeedFill', 'RiSpeedLine', 'RiSpeedMiniFill', 'RiSpeedMiniLine', 'RiSpeedUpFill', 'RiSpeedUpLine', 'RiSplitCellsHorizontal', 'RiSplitCellsVertical', 'RiSpotifyFill', 'RiSpotifyLine', 'RiSpyFill', 'RiSpyLine', 'RiSquareFill', 'RiSquareLine', 'RiSquareRoot', 'RiStackFill', 'RiStackLine', 'RiStackOverflowFill', 'RiStackOverflowLine', 'RiStackedView', 'RiStackshareFill', 'RiStackshareLine', 'RiStarFill', 'RiStarHalfFill', 'RiStarHalfLine', 'RiStarHalfSFill', 'RiStarHalfSLine', 'RiStarLine', 'RiStarSFill', 'RiStarSLine', 'RiStarSmileFill', 'RiStarSmileLine', 'RiSteamFill', 'RiSteamLine', 'RiSteering2Fill', 'RiSteering2Line', 'RiSteeringFill', 'RiSteeringLine', 'RiStethoscopeFill', 'RiStethoscopeLine', 'RiStickyNote2Fill', 'RiStickyNote2Line', 'RiStickyNoteAddFill', 'RiStickyNoteAddLine', 'RiStickyNoteFill', 'RiStickyNoteLine', 'RiStockFill', 'RiStockLine', 'RiStopCircleFill', 'RiStopCircleLine', 'RiStopFill', 'RiStopLargeFill', 'RiStopLargeLine', 'RiStopLine', 'RiStopMiniFill', 'RiStopMiniLine', 'RiStore2Fill', 'RiStore2Line', 'RiStore3Fill', 'RiStore3Line', 'RiStoreFill', 'RiStoreLine', 'RiStrikethrough', 'RiStrikethrough2', 'RiSubscript', 'RiSubscript2', 'RiSubtractFill', 'RiSubtractLine', 'RiSubwayFill', 'RiSubwayLine', 'RiSubwayWifiFill', 'RiSubwayWifiLine', 'RiSuitcase2Fill', 'RiSuitcase2Line', 'RiSuitcase3Fill', 'RiSuitcase3Line', 'RiSuitcaseFill', 'RiSuitcaseLine', 'RiSunCloudyFill', 'RiSunCloudyLine', 'RiSunFill', 'RiSunFoggyFill', 'RiSunFoggyLine', 'RiSunLine', 'RiSupabaseFill', 'RiSupabaseLine', 'RiSuperscript', 'RiSuperscript2', 'RiSurgicalMaskFill', 'RiSurgicalMaskLine', 'RiSurroundSoundFill', 'RiSurroundSoundLine', 'RiSurveyFill', 'RiSurveyLine', 'RiSvelteFill', 'RiSvelteLine', 'RiSwap2Fill', 'RiSwap2Line', 'RiSwap3Fill', 'RiSwap3Line', 'RiSwapBoxFill', 'RiSwapBoxLine', 'RiSwapFill', 'RiSwapLine', 'RiSwitchFill', 'RiSwitchLine', 'RiSwordFill', 'RiSwordLine', 'RiSyringeFill', 'RiSyringeLine', 'RiTBoxFill', 'RiTBoxLine', 'RiTShirt2Fill', 'RiTShirt2Line', 'RiTShirtAirFill', 'RiTShirtAirLine', 'RiTShirtFill', 'RiTShirtLine', 'RiTable2', 'RiTable3', 'RiTableAltFill', 'RiTableAltLine', 'RiTableFill', 'RiTableLine', 'RiTableView', 'RiTabletFill', 'RiTabletLine', 'RiTailwindCssFill', 'RiTailwindCssLine', 'RiTakeawayFill', 'RiTakeawayLine', 'RiTaobaoFill', 'RiTaobaoLine', 'RiTapeFill', 'RiTapeLine', 'RiTaskFill', 'RiTaskLine', 'RiTaxiFill', 'RiTaxiLine', 'RiTaxiWifiFill', 'RiTaxiWifiLine', 'RiTeamFill', 'RiTeamLine', 'RiTelegramFill', 'RiTelegramLine', 'RiTempColdFill', 'RiTempColdLine', 'RiTempHotFill', 'RiTempHotLine', 'RiTentFill', 'RiTentLine', 'RiTerminalBoxFill', 'RiTerminalBoxLine', 'RiTerminalFill', 'RiTerminalLine', 'RiTerminalWindowFill', 'RiTerminalWindowLine', 'RiTestTubeFill', 'RiTestTubeLine', 'RiText', 'RiTextBlock', 'RiTextDirectionL', 'RiTextDirectionR', 'RiTextSnippet', 'RiTextSpacing', 'RiTextWrap', 'RiThermometerFill', 'RiThermometerLine', 'RiThreadsFill', 'RiThreadsLine', 'RiThumbDownFill', 'RiThumbDownLine', 'RiThumbUpFill', 'RiThumbUpLine', 'RiThunderstormsFill', 'RiThunderstormsLine', 'RiTicket2Fill', 'RiTicket2Line', 'RiTicketFill', 'RiTicketLine', 'RiTiktokFill', 'RiTiktokLine', 'RiTimeFill', 'RiTimeLine', 'RiTimeZoneFill', 'RiTimeZoneLine', 'RiTimelineView', 'RiTimer2Fill', 'RiTimer2Line', 'RiTimerFill', 'RiTimerFlashFill', 'RiTimerFlashLine', 'RiTimerLine', 'RiTodoFill', 'RiTodoLine', 'RiToggleFill', 'RiToggleLine', 'RiTokenSwapFill', 'RiTokenSwapLine', 'RiToolsFill', 'RiToolsLine', 'RiToothFill', 'RiToothLine', 'RiTornadoFill', 'RiTornadoLine', 'RiTrademarkFill', 'RiTrademarkLine', 'RiTrafficLightFill', 'RiTrafficLightLine', 'RiTrainFill', 'RiTrainLine', 'RiTrainWifiFill', 'RiTrainWifiLine', 'RiTranslate', 'RiTranslate2', 'RiTravestiFill', 'RiTravestiLine', 'RiTreasureMapFill', 'RiTreasureMapLine', 'RiTreeFill', 'RiTreeLine', 'RiTrelloFill', 'RiTrelloLine', 'RiTriangleFill', 'RiTriangleLine', 'RiTrophyFill', 'RiTrophyLine', 'RiTruckFill', 'RiTruckLine', 'RiTumblrFill', 'RiTumblrLine', 'RiTv2Fill', 'RiTv2Line', 'RiTvFill', 'RiTvLine', 'RiTwitchFill', 'RiTwitchLine', 'RiTwitterFill', 'RiTwitterLine', 'RiTwitterXFill', 'RiTwitterXLine', 'RiTyphoonFill', 'RiTyphoonLine', 'RiUDiskFill', 'RiUDiskLine', 'RiUbuntuFill', 'RiUbuntuLine', 'RiUmbrellaFill', 'RiUmbrellaLine', 'RiUnderline', 'RiUninstallFill', 'RiUninstallLine', 'RiUnpinFill', 'RiUnpinLine', 'RiUnsplashFill', 'RiUnsplashLine', 'RiUpload2Fill', 'RiUpload2Line', 'RiUploadCloud2Fill', 'RiUploadCloud2Line', 'RiUploadCloudFill', 'RiUploadCloudLine', 'RiUploadFill', 'RiUploadLine', 'RiUsbFill', 'RiUsbLine', 'RiUser2Fill', 'RiUser2Line', 'RiUser3Fill', 'RiUser3Line', 'RiUser4Fill', 'RiUser4Line', 'RiUser5Fill', 'RiUser5Line', 'RiUser6Fill', 'RiUser6Line', 'RiUserAddFill', 'RiUserAddLine', 'RiUserFill', 'RiUserFollowFill', 'RiUserFollowLine', 'RiUserForbidFill', 'RiUserForbidLine', 'RiUserHeartFill', 'RiUserHeartLine', 'RiUserLine', 'RiUserLocationFill', 'RiUserLocationLine', 'RiUserReceived2Fill', 'RiUserReceived2Line', 'RiUserReceivedFill', 'RiUserReceivedLine', 'RiUserSearchFill', 'RiUserSearchLine', 'RiUserSettingsFill', 'RiUserSettingsLine', 'RiUserShared2Fill', 'RiUserShared2Line', 'RiUserSharedFill', 'RiUserSharedLine', 'RiUserSmileFill', 'RiUserSmileLine', 'RiUserStarFill', 'RiUserStarLine', 'RiUserUnfollowFill', 'RiUserUnfollowLine', 'RiUserVoiceFill', 'RiUserVoiceLine', 'RiVerifiedBadgeFill', 'RiVerifiedBadgeLine', 'RiVideoAddFill', 'RiVideoAddLine', 'RiVideoChatFill', 'RiVideoChatLine', 'RiVideoDownloadFill', 'RiVideoDownloadLine', 'RiVideoFill', 'RiVideoLine', 'RiVideoOffFill', 'RiVideoOffLine', 'RiVideoOnFill', 'RiVideoOnLine', 'RiVideoUploadFill', 'RiVideoUploadLine', 'RiVidicon2Fill', 'RiVidicon2Line', 'RiVidiconFill', 'RiVidiconLine', 'RiVimeoFill', 'RiVimeoLine', 'RiVipCrown2Fill', 'RiVipCrown2Line', 'RiVipCrownFill', 'RiVipCrownLine', 'RiVipDiamondFill', 'RiVipDiamondLine', 'RiVipFill', 'RiVipLine', 'RiVirusFill', 'RiVirusLine', 'RiVisaFill', 'RiVisaLine', 'RiVkFill', 'RiVkLine', 'RiVoiceRecognitionFill', 'RiVoiceRecognitionLine', 'RiVoiceprintFill', 'RiVoiceprintLine', 'RiVolumeDownFill', 'RiVolumeDownLine', 'RiVolumeMuteFill', 'RiVolumeMuteLine', 'RiVolumeOffVibrateFill', 'RiVolumeOffVibrateLine', 'RiVolumeUpFill', 'RiVolumeUpLine', 'RiVolumeVibrateFill', 'RiVolumeVibrateLine', 'RiVuejsFill', 'RiVuejsLine', 'RiWalkFill', 'RiWalkLine', 'RiWallet2Fill', 'RiWallet2Line', 'RiWallet3Fill', 'RiWallet3Line', 'RiWalletFill', 'RiWalletLine', 'RiWaterFlashFill', 'RiWaterFlashLine', 'RiWaterPercentFill', 'RiWaterPercentLine', 'RiWebcamFill', 'RiWebcamLine', 'RiWebhookFill', 'RiWebhookLine', 'RiWechat2Fill', 'RiWechat2Line', 'RiWechatChannelsFill', 'RiWechatChannelsLine', 'RiWechatFill', 'RiWechatLine', 'RiWechatPayFill', 'RiWechatPayLine', 'RiWeiboFill', 'RiWeiboLine', 'RiWeightFill', 'RiWeightLine', 'RiWhatsappFill', 'RiWhatsappLine', 'RiWheelchairFill', 'RiWheelchairLine', 'RiWifiFill', 'RiWifiLine', 'RiWifiOffFill', 'RiWifiOffLine', 'RiWindow2Fill', 'RiWindow2Line', 'RiWindowFill', 'RiWindowLine', 'RiWindowsFill', 'RiWindowsLine', 'RiWindyFill', 'RiWindyLine', 'RiWirelessChargingFill', 'RiWirelessChargingLine', 'RiWomenFill', 'RiWomenLine', 'RiWordpressFill', 'RiWordpressLine', 'RiWubiInput', 'RiXboxFill', 'RiXboxLine', 'RiXingFill', 'RiXingLine', 'RiXrpFill', 'RiXrpLine', 'RiXtzFill', 'RiXtzLine', 'RiYoutubeFill', 'RiYoutubeLine', 'RiYuqueFill', 'RiYuqueLine', 'RiZcoolFill', 'RiZcoolLine', 'RiZhihuFill', 'RiZhihuLine', 'RiZoomInFill', 'RiZoomInLine', 'RiZoomOutFill', 'RiZoomOutLine', 'RiZzzFill', 'RiZzzLine');
EXCEPTION
 WHEN duplicate_object THEN null;
END $$;
--> statement-breakpoint
DO $$ BEGIN
 CREATE TYPE "public"."type" AS ENUM('SOURCE', 'WORKFLOW', 'VIEW', 'SIDEBAR', 'EFFECT', 'AUTH');
EXCEPTION
 WHEN duplicate_object THEN null;
END $$;
--> statement-breakpoint
DO $$ BEGIN
 CREATE TYPE "public"."processDefinitionState" AS ENUM('PENDING', 'LIVE', 'PAUSED');
EXCEPTION
 WHEN duplicate_object THEN null;
END $$;
--> statement-breakpoint
DO $$ BEGIN
 CREATE TYPE "public"."processState" AS ENUM('NEW', 'ACTIVE', 'FINISHED');
EXCEPTION
 WHEN duplicate_object THEN null;
END $$;
--> statement-breakpoint
CREATE TABLE IF NOT EXISTS "core"."action" (
	"id" uuid DEFAULT gen_random_uuid() NOT NULL,
	"title" text NOT NULL,
	"task_id" uuid NOT NULL,
	"description" text,
	"created_at" timestamp DEFAULT now() NOT NULL,
	"updated_at" timestamp,
	CONSTRAINT "action_id_pk" PRIMARY KEY("id")
);
--> statement-breakpoint
CREATE TABLE IF NOT EXISTS "core"."assignment" (
	"id" uuid DEFAULT gen_random_uuid() NOT NULL,
	"process_id" uuid NOT NULL,
	"task_id" uuid NOT NULL,
	"user_id" uuid NOT NULL,
	"overtaken" boolean DEFAULT false NOT NULL,
	"viewed" boolean DEFAULT false NOT NULL,
	"visible_since" timestamp DEFAULT now() NOT NULL,
	"created_at" timestamp DEFAULT now() NOT NULL,
	"updated_at" timestamp,
	CONSTRAINT "assignment_id_pk" PRIMARY KEY("id"),
	CONSTRAINT "assignment_process_id_task_id_user_id_unique" UNIQUE("process_id","task_id","user_id")
);
--> statement-breakpoint
CREATE TABLE IF NOT EXISTS "core"."assignment_definition" (
	"id" uuid DEFAULT gen_random_uuid() NOT NULL,
	"task_id" uuid NOT NULL,
	"group_id" uuid NOT NULL,
	"created_at" timestamp DEFAULT now() NOT NULL,
	"updated_at" timestamp,
	CONSTRAINT "hallo" PRIMARY KEY("id")
);
--> statement-breakpoint
CREATE TABLE IF NOT EXISTS "core"."effect" (
	"id" uuid DEFAULT gen_random_uuid() NOT NULL,
	"title" text NOT NULL,
	"action_id" uuid NOT NULL,
	"plugin_key" text NOT NULL,
	"plugin_id" uuid NOT NULL,
	"created_at" timestamp DEFAULT now() NOT NULL,
	"updated_at" timestamp,
	CONSTRAINT "effect_id_pk" PRIMARY KEY("id")
);
--> statement-breakpoint
CREATE TABLE IF NOT EXISTS "core"."event" (
	"id" uuid DEFAULT gen_random_uuid() NOT NULL,
	"user_id" uuid,
	"process_id" uuid NOT NULL,
	"message" text NOT NULL,
	"task_id" uuid,
	"type" "event_type" NOT NULL,
	"created_at" timestamp DEFAULT now() NOT NULL,
	CONSTRAINT "event_id_pk" PRIMARY KEY("id")
);
--> statement-breakpoint
CREATE TABLE IF NOT EXISTS "core"."event_input_change" (
	"id" uuid DEFAULT gen_random_uuid() NOT NULL,
	"old_value" text,
	"new_value" text,
	"event_id" uuid NOT NULL,
	"input_id" uuid NOT NULL,
	"created_at" timestamp DEFAULT now() NOT NULL,
	CONSTRAINT "event_input_change_id_pk" PRIMARY KEY("id")
);
--> statement-breakpoint
CREATE TABLE IF NOT EXISTS "core"."extractor" (
	"id" uuid DEFAULT gen_random_uuid() NOT NULL,
	"label" text,
	"value" text,
	"processDefinition_id" uuid NOT NULL,
	"created_at" timestamp DEFAULT now() NOT NULL,
	"updated_at" timestamp,
	CONSTRAINT "extractor_id_pk" PRIMARY KEY("id")
);
--> statement-breakpoint
CREATE TABLE IF NOT EXISTS "core"."group" (
	"id" uuid DEFAULT gen_random_uuid() NOT NULL,
	"title" text NOT NULL,
	"created_at" timestamp DEFAULT now() NOT NULL,
	"updated_at" timestamp,
	CONSTRAINT "group_id_pk" PRIMARY KEY("id")
);
--> statement-breakpoint
CREATE TABLE IF NOT EXISTS "core"."input" (
	"id" uuid DEFAULT gen_random_uuid() NOT NULL,
	"input_definition_id" uuid NOT NULL,
	"process_id" uuid NOT NULL,
	"value" text,
	"updated_from" uuid,
	"created_at" timestamp DEFAULT now() NOT NULL,
	"updated_at" timestamp,
	CONSTRAINT "input_id_pk" PRIMARY KEY("id"),
	CONSTRAINT "inputId_process_id" UNIQUE("input_definition_id","process_id")
);
--> statement-breakpoint
CREATE TABLE IF NOT EXISTS "core"."input_definition" (
	"id" uuid DEFAULT gen_random_uuid() NOT NULL,
	"task_id" uuid NOT NULL,
	"order" integer NOT NULL,
	"input_type" "inputType" NOT NULL,
	"label" text,
	"placeholder" text,
	"default_value" text,
	"created_at" timestamp DEFAULT now() NOT NULL,
	"updated_at" timestamp,
	CONSTRAINT "input_definition_id_pk" PRIMARY KEY("id")
);
--> statement-breakpoint
CREATE TABLE IF NOT EXISTS "core"."input_option" (
	"id" uuid DEFAULT gen_random_uuid() NOT NULL,
	"input_option_definition_id" uuid NOT NULL,
	"process_id" uuid NOT NULL,
	"value" text,
	"created_at" timestamp DEFAULT now() NOT NULL,
	"updated_at" timestamp,
	CONSTRAINT "input_option_id_pk" PRIMARY KEY("id"),
	CONSTRAINT "inputOptionId_processId" UNIQUE("input_option_definition_id","process_id")
);
--> statement-breakpoint
CREATE TABLE IF NOT EXISTS "core"."input_option_definition" (
	"id" uuid DEFAULT gen_random_uuid() NOT NULL,
	"input_definition_id" uuid NOT NULL,
	"label" text,
	"order" integer NOT NULL,
	"default_value" text,
	"created_at" timestamp DEFAULT now() NOT NULL,
	"updated_at" timestamp,
	CONSTRAINT "input_option_definition_id_pk" PRIMARY KEY("id")
);
--> statement-breakpoint
CREATE TABLE IF NOT EXISTS "core"."membership" (
	"id" uuid DEFAULT gen_random_uuid() NOT NULL,
	"user_id" uuid NOT NULL,
	"group_id" uuid NOT NULL,
	"created_at" timestamp DEFAULT now() NOT NULL,
	"updated_at" timestamp,
	CONSTRAINT "membership_id_pk" PRIMARY KEY("id")
);
--> statement-breakpoint
CREATE TABLE IF NOT EXISTS "core"."plugin" (
	"id" uuid DEFAULT gen_random_uuid() NOT NULL,
	"plugin_group_id" uuid NOT NULL,
	"key" text NOT NULL,
	"type" "type" NOT NULL,
	"slug" text,
	"order" integer,
	"icon" "icon",
	"created_at" timestamp DEFAULT now() NOT NULL,
	"updated_at" timestamp,
	CONSTRAINT "plugin_id_pk" PRIMARY KEY("id"),
	CONSTRAINT "plugin_slug_unique" UNIQUE("slug"),
	CONSTRAINT "plugin_key_unique" UNIQUE("key")
);
--> statement-breakpoint
CREATE TABLE IF NOT EXISTS "core"."plugin_group" (
	"id" uuid DEFAULT gen_random_uuid() NOT NULL,
	"key" text NOT NULL,
	"title" text NOT NULL,
	"description" text,
	"version" varchar(5) NOT NULL,
	"config" jsonb,
	"active" boolean DEFAULT true NOT NULL,
	"created_at" timestamp DEFAULT now() NOT NULL,
	"updated_at" timestamp,
	CONSTRAINT "plugin_group_id_pk" PRIMARY KEY("id"),
	CONSTRAINT "plugin_group_key_unique" UNIQUE("key")
);
--> statement-breakpoint
CREATE TABLE IF NOT EXISTS "core"."process" (
	"id" uuid DEFAULT gen_random_uuid() NOT NULL,
	"submission" text NOT NULL,
	"process_definition_id" uuid NOT NULL,
	"state" "processState" DEFAULT 'NEW' NOT NULL,
	"deadline" date NOT NULL,
	"created_at" timestamp DEFAULT now() NOT NULL,
	"updated_at" timestamp,
	CONSTRAINT "process_id_pk" PRIMARY KEY("id")
);
--> statement-breakpoint
CREATE TABLE IF NOT EXISTS "core"."process_definition" (
	"id" uuid DEFAULT gen_random_uuid() NOT NULL,
	"deadline" smallint DEFAULT 130 NOT NULL,
	"state" "processDefinitionState" DEFAULT 'PENDING' NOT NULL,
	"version" smallint DEFAULT 1 NOT NULL,
	"processDefinition_group_id" uuid NOT NULL,
	"source_id" uuid,
	"source_key" text,
	"view_id" uuid,
	"view_key" text,
	"workflow_key" text,
	"created_at" timestamp DEFAULT now() NOT NULL,
	"updated_at" timestamp,
	CONSTRAINT "process_definition_id_pk" PRIMARY KEY("id")
);
--> statement-breakpoint
CREATE TABLE IF NOT EXISTS "core"."process_definition_group" (
	"id" uuid DEFAULT gen_random_uuid() NOT NULL,
	"name" text NOT NULL,
	"created_at" timestamp DEFAULT now() NOT NULL,
	CONSTRAINT "process_definition_group_id_pk" PRIMARY KEY("id")
);
--> statement-breakpoint
CREATE TABLE IF NOT EXISTS "core"."process_item" (
	"id" uuid DEFAULT gen_random_uuid() NOT NULL,
	"process_definition_id" uuid NOT NULL,
	"extractor_id" uuid NOT NULL,
	"item_order" smallint NOT NULL,
	"created_at" timestamp DEFAULT now() NOT NULL,
	"updated_at" timestamp,
	CONSTRAINT "process_item_id_pk" PRIMARY KEY("id"),
	CONSTRAINT "process_item_process_definition_id_item_order_unique" UNIQUE("process_definition_id","item_order")
);
--> statement-breakpoint
CREATE TABLE IF NOT EXISTS "core"."task" (
	"id" uuid DEFAULT gen_random_uuid() NOT NULL,
	"processDefinition_id" uuid NOT NULL,
	"title" text NOT NULL,
	"description" text,
	"start" boolean DEFAULT false NOT NULL,
	"created_at" timestamp DEFAULT now() NOT NULL,
	"updated_at" timestamp,
	CONSTRAINT "task_id_pk" PRIMARY KEY("id")
);
--> statement-breakpoint
CREATE TABLE IF NOT EXISTS "core"."upload" (
	"id" uuid DEFAULT gen_random_uuid() NOT NULL,
	"process_id" uuid NOT NULL,
	"input_id" uuid,
	"user_id" uuid,
	"name" text NOT NULL,
	"type" text NOT NULL,
	"size" integer NOT NULL,
	"created_at" timestamp DEFAULT now() NOT NULL,
	"updated_at" timestamp,
	CONSTRAINT "upload_id_pk" PRIMARY KEY("id")
);
--> statement-breakpoint
CREATE TABLE IF NOT EXISTS "core"."session" (
	"id" text NOT NULL,
	"user_id" uuid NOT NULL,
	"expires_at" timestamp with time zone NOT NULL,
	CONSTRAINT "session_id_pk" PRIMARY KEY("id")
);
--> statement-breakpoint
CREATE TABLE IF NOT EXISTS "core"."user" (
	"id" uuid DEFAULT gen_random_uuid() NOT NULL,
	"email" text NOT NULL,
	"password" text NOT NULL,
	"first_name" text NOT NULL,
	"last_name" text NOT NULL,
	"deactivated" boolean DEFAULT false NOT NULL,
	"created_at" timestamp DEFAULT now() NOT NULL,
	"updated_at" timestamp,
	CONSTRAINT "user_id_pk" PRIMARY KEY("id"),
	CONSTRAINT "user_email_unique" UNIQUE("email")
);
--> statement-breakpoint
CREATE TABLE IF NOT EXISTS "plugin"."comment" (
	"id" uuid DEFAULT gen_random_uuid() NOT NULL,
	"message" text NOT NULL,
	"userId" uuid,
	"processId" uuid NOT NULL,
	"created_at" timestamp DEFAULT now() NOT NULL,
	"updated_at" timestamp,
	CONSTRAINT "comment_id_pk" PRIMARY KEY("id")
);
--> statement-breakpoint
CREATE TABLE IF NOT EXISTS "plugin"."linear" (
	"id" uuid DEFAULT gen_random_uuid() NOT NULL,
	"action_id" uuid NOT NULL,
	"to_task_id" uuid,
	"created_at" timestamp DEFAULT now() NOT NULL,
	"updated_at" timestamp,
	CONSTRAINT "linear_id_pk" PRIMARY KEY("id")
);
--> statement-breakpoint
CREATE TABLE IF NOT EXISTS "plugin"."simpleView" (
	"id" uuid DEFAULT gen_random_uuid() NOT NULL,
	"processDefinition_id" uuid NOT NULL,
	"created_at" timestamp DEFAULT now() NOT NULL,
	"updated_at" timestamp,
	CONSTRAINT "simpleView_id_pk" PRIMARY KEY("id")
);
--> statement-breakpoint
CREATE TABLE IF NOT EXISTS "plugin"."simpleView_group" (
	"id" uuid DEFAULT gen_random_uuid() NOT NULL,
	"title" text NOT NULL,
	"simpleView_id" uuid NOT NULL,
	"order" integer NOT NULL,
	"created_at" timestamp DEFAULT now() NOT NULL,
	CONSTRAINT "simpleView_group_id_pk" PRIMARY KEY("id")
);
--> statement-breakpoint
CREATE TABLE IF NOT EXISTS "plugin"."simpleView_row" (
	"id" uuid DEFAULT gen_random_uuid() NOT NULL,
	"simpleView_group_id" uuid NOT NULL,
	"extractor_id" uuid NOT NULL,
	"order" integer NOT NULL,
	"created_at" timestamp DEFAULT now() NOT NULL,
	CONSTRAINT "simpleView_row_id_pk" PRIMARY KEY("id")
);
--> statement-breakpoint
CREATE TABLE IF NOT EXISTS "plugin"."source" (
	"id" uuid DEFAULT gen_random_uuid() NOT NULL,
	"url" text,
	"processDefinition_id" uuid NOT NULL,
	"created_at" timestamp DEFAULT now() NOT NULL,
	"updated_at" timestamp,
	CONSTRAINT "source_id_pk" PRIMARY KEY("id")
);
--> statement-breakpoint
DO $$ BEGIN
 ALTER TABLE "core"."action" ADD CONSTRAINT "fk_task" FOREIGN KEY ("task_id") REFERENCES "core"."task"("id") ON DELETE cascade ON UPDATE no action;
EXCEPTION
 WHEN duplicate_object THEN null;
END $$;
--> statement-breakpoint
DO $$ BEGIN
 ALTER TABLE "core"."assignment" ADD CONSTRAINT "fk_process" FOREIGN KEY ("process_id") REFERENCES "core"."process"("id") ON DELETE cascade ON UPDATE no action;
EXCEPTION
 WHEN duplicate_object THEN null;
END $$;
--> statement-breakpoint
DO $$ BEGIN
 ALTER TABLE "core"."assignment" ADD CONSTRAINT "fk_task" FOREIGN KEY ("task_id") REFERENCES "core"."task"("id") ON DELETE cascade ON UPDATE no action;
EXCEPTION
 WHEN duplicate_object THEN null;
END $$;
--> statement-breakpoint
DO $$ BEGIN
 ALTER TABLE "core"."assignment" ADD CONSTRAINT "fk_user" FOREIGN KEY ("user_id") REFERENCES "core"."user"("id") ON DELETE cascade ON UPDATE no action;
EXCEPTION
 WHEN duplicate_object THEN null;
END $$;
--> statement-breakpoint
DO $$ BEGIN
 ALTER TABLE "core"."assignment_definition" ADD CONSTRAINT "fk_task" FOREIGN KEY ("task_id") REFERENCES "core"."task"("id") ON DELETE cascade ON UPDATE no action;
EXCEPTION
 WHEN duplicate_object THEN null;
END $$;
--> statement-breakpoint
DO $$ BEGIN
 ALTER TABLE "core"."assignment_definition" ADD CONSTRAINT "fk_group" FOREIGN KEY ("group_id") REFERENCES "core"."group"("id") ON DELETE cascade ON UPDATE no action;
EXCEPTION
 WHEN duplicate_object THEN null;
END $$;
--> statement-breakpoint
DO $$ BEGIN
 ALTER TABLE "core"."effect" ADD CONSTRAINT "fk_action" FOREIGN KEY ("action_id") REFERENCES "core"."action"("id") ON DELETE cascade ON UPDATE no action;
EXCEPTION
 WHEN duplicate_object THEN null;
END $$;
--> statement-breakpoint
DO $$ BEGIN
 ALTER TABLE "core"."event" ADD CONSTRAINT "fk_user_id" FOREIGN KEY ("user_id") REFERENCES "core"."user"("id") ON DELETE cascade ON UPDATE no action;
EXCEPTION
 WHEN duplicate_object THEN null;
END $$;
--> statement-breakpoint
DO $$ BEGIN
 ALTER TABLE "core"."event" ADD CONSTRAINT "fk_process_id" FOREIGN KEY ("process_id") REFERENCES "core"."process"("id") ON DELETE cascade ON UPDATE no action;
EXCEPTION
 WHEN duplicate_object THEN null;
END $$;
--> statement-breakpoint
DO $$ BEGIN
 ALTER TABLE "core"."event" ADD CONSTRAINT "fk_task_id" FOREIGN KEY ("task_id") REFERENCES "core"."task"("id") ON DELETE cascade ON UPDATE no action;
EXCEPTION
 WHEN duplicate_object THEN null;
END $$;
--> statement-breakpoint
DO $$ BEGIN
 ALTER TABLE "core"."event_input_change" ADD CONSTRAINT "fk_event" FOREIGN KEY ("event_id") REFERENCES "core"."event"("id") ON DELETE cascade ON UPDATE no action;
EXCEPTION
 WHEN duplicate_object THEN null;
END $$;
--> statement-breakpoint
DO $$ BEGIN
 ALTER TABLE "core"."event_input_change" ADD CONSTRAINT "fk_input" FOREIGN KEY ("input_id") REFERENCES "core"."input"("id") ON DELETE no action ON UPDATE no action;
EXCEPTION
 WHEN duplicate_object THEN null;
END $$;
--> statement-breakpoint
DO $$ BEGIN
 ALTER TABLE "core"."extractor" ADD CONSTRAINT "fk_processDefinition" FOREIGN KEY ("processDefinition_id") REFERENCES "core"."process_definition"("id") ON DELETE cascade ON UPDATE no action;
EXCEPTION
 WHEN duplicate_object THEN null;
END $$;
--> statement-breakpoint
DO $$ BEGIN
 ALTER TABLE "core"."input" ADD CONSTRAINT "fk_input_definition" FOREIGN KEY ("input_definition_id") REFERENCES "core"."input_definition"("id") ON DELETE cascade ON UPDATE no action;
EXCEPTION
 WHEN duplicate_object THEN null;
END $$;
--> statement-breakpoint
DO $$ BEGIN
 ALTER TABLE "core"."input" ADD CONSTRAINT "fk_process" FOREIGN KEY ("process_id") REFERENCES "core"."process"("id") ON DELETE cascade ON UPDATE no action;
EXCEPTION
 WHEN duplicate_object THEN null;
END $$;
--> statement-breakpoint
DO $$ BEGIN
 ALTER TABLE "core"."input_definition" ADD CONSTRAINT "fk_task" FOREIGN KEY ("task_id") REFERENCES "core"."task"("id") ON DELETE cascade ON UPDATE no action;
EXCEPTION
 WHEN duplicate_object THEN null;
END $$;
--> statement-breakpoint
DO $$ BEGIN
 ALTER TABLE "core"."input_option" ADD CONSTRAINT "fk_input_option_definition" FOREIGN KEY ("input_option_definition_id") REFERENCES "core"."input_option_definition"("id") ON DELETE cascade ON UPDATE no action;
EXCEPTION
 WHEN duplicate_object THEN null;
END $$;
--> statement-breakpoint
DO $$ BEGIN
 ALTER TABLE "core"."input_option" ADD CONSTRAINT "fk_process" FOREIGN KEY ("process_id") REFERENCES "core"."process"("id") ON DELETE cascade ON UPDATE no action;
EXCEPTION
 WHEN duplicate_object THEN null;
END $$;
--> statement-breakpoint
DO $$ BEGIN
 ALTER TABLE "core"."input_option_definition" ADD CONSTRAINT "fk_input_definition" FOREIGN KEY ("input_definition_id") REFERENCES "core"."input_definition"("id") ON DELETE cascade ON UPDATE no action;
EXCEPTION
 WHEN duplicate_object THEN null;
END $$;
--> statement-breakpoint
DO $$ BEGIN
 ALTER TABLE "core"."membership" ADD CONSTRAINT "fk_user" FOREIGN KEY ("user_id") REFERENCES "core"."user"("id") ON DELETE cascade ON UPDATE no action;
EXCEPTION
 WHEN duplicate_object THEN null;
END $$;
--> statement-breakpoint
DO $$ BEGIN
 ALTER TABLE "core"."membership" ADD CONSTRAINT "fk_group" FOREIGN KEY ("group_id") REFERENCES "core"."group"("id") ON DELETE cascade ON UPDATE no action;
EXCEPTION
 WHEN duplicate_object THEN null;
END $$;
--> statement-breakpoint
DO $$ BEGIN
 ALTER TABLE "core"."plugin" ADD CONSTRAINT "fk_plugin_group" FOREIGN KEY ("plugin_group_id") REFERENCES "core"."plugin_group"("id") ON DELETE cascade ON UPDATE no action;
EXCEPTION
 WHEN duplicate_object THEN null;
END $$;
--> statement-breakpoint
DO $$ BEGIN
 ALTER TABLE "core"."process" ADD CONSTRAINT "fk_process_definition" FOREIGN KEY ("process_definition_id") REFERENCES "core"."process_definition"("id") ON DELETE cascade ON UPDATE no action;
EXCEPTION
 WHEN duplicate_object THEN null;
END $$;
--> statement-breakpoint
DO $$ BEGIN
 ALTER TABLE "core"."process_definition" ADD CONSTRAINT "fk_processDefinition_group" FOREIGN KEY ("processDefinition_group_id") REFERENCES "core"."process_definition_group"("id") ON DELETE cascade ON UPDATE no action;
EXCEPTION
 WHEN duplicate_object THEN null;
END $$;
--> statement-breakpoint
DO $$ BEGIN
 ALTER TABLE "core"."process_item" ADD CONSTRAINT "fk_process_definition" FOREIGN KEY ("process_definition_id") REFERENCES "core"."process_definition"("id") ON DELETE cascade ON UPDATE no action;
EXCEPTION
 WHEN duplicate_object THEN null;
END $$;
--> statement-breakpoint
DO $$ BEGIN
 ALTER TABLE "core"."process_item" ADD CONSTRAINT "fk_extractor" FOREIGN KEY ("extractor_id") REFERENCES "core"."extractor"("id") ON DELETE cascade ON UPDATE no action;
EXCEPTION
 WHEN duplicate_object THEN null;
END $$;
--> statement-breakpoint
DO $$ BEGIN
 ALTER TABLE "core"."task" ADD CONSTRAINT "fk_processDefinition" FOREIGN KEY ("processDefinition_id") REFERENCES "core"."process_definition"("id") ON DELETE cascade ON UPDATE no action;
EXCEPTION
 WHEN duplicate_object THEN null;
END $$;
--> statement-breakpoint
DO $$ BEGIN
 ALTER TABLE "core"."upload" ADD CONSTRAINT "fk_process" FOREIGN KEY ("process_id") REFERENCES "core"."process"("id") ON DELETE cascade ON UPDATE no action;
EXCEPTION
 WHEN duplicate_object THEN null;
END $$;
--> statement-breakpoint
DO $$ BEGIN
 ALTER TABLE "core"."upload" ADD CONSTRAINT "fk_input" FOREIGN KEY ("input_id") REFERENCES "core"."input"("id") ON DELETE cascade ON UPDATE no action;
EXCEPTION
 WHEN duplicate_object THEN null;
END $$;
--> statement-breakpoint
DO $$ BEGIN
 ALTER TABLE "core"."upload" ADD CONSTRAINT "fk_user" FOREIGN KEY ("user_id") REFERENCES "core"."user"("id") ON DELETE no action ON UPDATE no action;
EXCEPTION
 WHEN duplicate_object THEN null;
END $$;
--> statement-breakpoint
DO $$ BEGIN
 ALTER TABLE "core"."session" ADD CONSTRAINT "fk_user" FOREIGN KEY ("user_id") REFERENCES "core"."user"("id") ON DELETE cascade ON UPDATE no action;
EXCEPTION
 WHEN duplicate_object THEN null;
END $$;
--> statement-breakpoint
DO $$ BEGIN
 ALTER TABLE "plugin"."comment" ADD CONSTRAINT "fk_user" FOREIGN KEY ("userId") REFERENCES "core"."user"("id") ON DELETE set null ON UPDATE no action;
EXCEPTION
 WHEN duplicate_object THEN null;
END $$;
--> statement-breakpoint
DO $$ BEGIN
 ALTER TABLE "plugin"."comment" ADD CONSTRAINT "fk_process" FOREIGN KEY ("processId") REFERENCES "core"."process"("id") ON DELETE cascade ON UPDATE no action;
EXCEPTION
 WHEN duplicate_object THEN null;
END $$;
--> statement-breakpoint
DO $$ BEGIN
 ALTER TABLE "plugin"."linear" ADD CONSTRAINT "fk_action" FOREIGN KEY ("action_id") REFERENCES "core"."action"("id") ON DELETE cascade ON UPDATE no action;
EXCEPTION
 WHEN duplicate_object THEN null;
END $$;
--> statement-breakpoint
DO $$ BEGIN
 ALTER TABLE "plugin"."linear" ADD CONSTRAINT "fk_task" FOREIGN KEY ("to_task_id") REFERENCES "core"."task"("id") ON DELETE cascade ON UPDATE no action;
EXCEPTION
 WHEN duplicate_object THEN null;
END $$;
--> statement-breakpoint
DO $$ BEGIN
 ALTER TABLE "plugin"."simpleView" ADD CONSTRAINT "fk_processDefinition" FOREIGN KEY ("processDefinition_id") REFERENCES "core"."process_definition"("id") ON DELETE cascade ON UPDATE no action;
EXCEPTION
 WHEN duplicate_object THEN null;
END $$;
--> statement-breakpoint
DO $$ BEGIN
 ALTER TABLE "plugin"."simpleView_group" ADD CONSTRAINT "fk_simple_view" FOREIGN KEY ("simpleView_id") REFERENCES "plugin"."simpleView"("id") ON DELETE cascade ON UPDATE no action;
EXCEPTION
 WHEN duplicate_object THEN null;
END $$;
--> statement-breakpoint
DO $$ BEGIN
 ALTER TABLE "plugin"."simpleView_row" ADD CONSTRAINT "fk_simple_view_group" FOREIGN KEY ("simpleView_group_id") REFERENCES "plugin"."simpleView_group"("id") ON DELETE cascade ON UPDATE no action;
EXCEPTION
 WHEN duplicate_object THEN null;
END $$;
--> statement-breakpoint
DO $$ BEGIN
 ALTER TABLE "plugin"."simpleView_row" ADD CONSTRAINT "fk_extractor" FOREIGN KEY ("extractor_id") REFERENCES "core"."extractor"("id") ON DELETE cascade ON UPDATE no action;
EXCEPTION
 WHEN duplicate_object THEN null;
END $$;
--> statement-breakpoint
DO $$ BEGIN
 ALTER TABLE "plugin"."source" ADD CONSTRAINT "fk_processDefinition" FOREIGN KEY ("processDefinition_id") REFERENCES "core"."process_definition"("id") ON DELETE cascade ON UPDATE no action;
EXCEPTION
 WHEN duplicate_object THEN null;
END $$;
