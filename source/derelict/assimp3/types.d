/*

Boost Software License - Version 1.0 - August 17th, 2003

Permission is hereby granted, free of charge, to any person or organization
obtaining a copy of the software and accompanying documentation covered by
this license (the "Software") to use, reproduce, display, distribute,
execute, and transmit the Software, and to prepare derivative works of the
Software, and to permit third-parties to whom the Software is furnished to
do so, all subject to the following:

The copyright notices in the Software and this entire statement, including
the above license grant, this restriction and the following disclaimer,
must be included in all copies of the Software, in whole or in part, and
all derivative works of the Software, unless such copies or derivative
works are solely in the form of machine-executable object code generated by
a source language processor.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
FITNESS FOR A PARTICULAR PURPOSE, TITLE AND NON-INFRINGEMENT. IN NO EVENT
SHALL THE COPYRIGHT HOLDERS OR ANYONE DISTRIBUTING THE SOFTWARE BE LIABLE
FOR ANY DAMAGES OR OTHER LIABILITY, WHETHER IN CONTRACT, TORT OR OTHERWISE,
ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER
DEALINGS IN THE SOFTWARE.

*/
module derelict.assimp3.types;

// anim.h
struct aiVectorKey {
    double mTime;
    aiVector3D mValue;
}

struct aiQuatKey {
    double mTime;
    aiQuaternion mValue;
}

struct aiMeshKey {
    double mTime;
    uint mValue;
}

alias aiAnimBehaviour = uint;
enum : uint {
    aiAnimBehaviour_DEFAULT = 0x0,
    aiAnimBehaviour_CONSTANT = 0x1,
    aiAnimBehaviour_LINEAR = 0x2,
    aiAnimBehaviour_REPEAT = 0x3,
}

struct aiNodeAnim {
    aiString mNodeName;
    uint mNumPositionKeys;
    aiVectorKey* mPositionKeys;
    uint mNumRotationKeys;
    aiQuatKey* mRotationKeys;
    uint mNumScalingKeys;
    aiVectorKey* mScalingKeys;
    aiAnimBehaviour mPreState;
    aiAnimBehaviour mPostState;
}

struct aiMeshAnim {
    aiString mName;
    uint mNumKeys;
    aiMeshKey* mKeys;
}

struct aiAnimation {
    aiString mName;
    double mDuration;
    double mTicksPerSecond;
    uint mNumChannels;
    aiNodeAnim** mChannels;
    uint mNumMeshChannels;
    aiMeshAnim** mMeshChannels;
}

// camera.h
struct aiCamera {
    aiString mName;
    aiVector3D mPosition;
    aiVector3D mUp;
    aiVector3D mLookAt;
    float mHorizontalFOV;
    float mClipPlaneNear;
    float mClipPlaneFar;
    float mAspect;
}

// cexport.h
struct aiExportFormatDesc {
    const( char )* id;
    const( char )* description;
    const( char )* fileExtension;
}

struct aiExportDataBlob {
    size_t size;
    void* data;
    aiString name;
    aiExportDataBlob* next;
}

// cfileio.h
extern( C ) nothrow {
    alias aiFileWriteProc = size_t function( aiFile*, const( char )*, size_t, size_t );
    alias aiFileReadProc = size_t function( aiFile*, char*, size_t, size_t );
    alias aiFileTellProc = size_t function( aiFile* );
    alias aiFileFlushProc = void function( aiFile* );
    alias aiFileSeek = aiReturn function( aiFile*, size_t, aiOrigin );
    alias aiFileOpenProc = aiFile* function(  aiFileIO*, const( char )*, const( char )* );
    alias aiFileCloseProc = void function( aiFileIO*, aiFile* );
}
alias aiUserData = void*;

struct aiFileIO {
    aiFileOpenProc OpenProc;
    aiFileCloseProc CloseProc;
    aiUserData UserData;
}

struct aiFile {
    aiFileReadProc ReadProc;
    aiFileWriteProc WriteProc;
    aiFileTellProc TellProc;
    aiFileTellProc FileSizeProc;
    aiFileSeek SeekProc;
    aiFileFlushProc FlushProc;
    aiUserData UserData;
}

// cimport.h
extern( C ) nothrow alias aiLogStreamCallback = void function( const( char )*, char* );

struct aiLogStream {
    aiLogStreamCallback callback;
    char* user;
}

struct aiPropertyStore {
    char sentinel;
}

alias aiBool = int;

enum AI_FALSE = 0,
     AI_TRUE = 1;

// color4.h
align(1) struct aiColor4D {
    float r, g, b, a;
}

// config.h
enum : string {
    AI_CONFIG_GLOB_MEASURE_TIME = "GLOB_MEASURE_TIME",
    AI_CONFIG_PP_SBBC_MAX_BONES = "PP_SBBC_MAX_BONES",
    AI_CONFIG_PP_CT_MAX_SMOOTHING_ANGLE = "PP_CT_MAX_SMOOTHING_ANGLE",
    AI_CONFIG_PP_CT_TEXTURE_CHANNEL_INDEX = "PP_CT_TEXTURE_CHANNEL_INDEX",
    AI_CONFIG_PP_GSN_MAX_SMOOTHING_ANGLE = "PP_GSN_MAX_SMOOTHING_ANGLE",
    AI_CONFIG_IMPORT_MDL_COLORMAP = "IMPORT_MDL_COLORMAP",
    AI_CONFIG_PP_RRM_EXCLUDE_LIST = "PP_RRM_EXCLUDE_LIST",
    AI_CONFIG_PP_PTV_KEEP_HIERARCHY = "PP_PTV_KEEP_HIERARCHY",
    AI_CONFIG_PP_PTV_NORMALIZE = "PP_PTV_NORMALIZE",
    AI_CONFIG_PP_FD_REMOVE = "PP_FD_REMOVE",
    AI_CONFIG_PP_OG_EXCLUDE_LIST = "PP_OG_EXCLUDE_LIST",
    AI_CONFIG_PP_SLM_TRIANGLE_LIMIT = "PP_SLM_TRIANGLE_LIMIT",
    AI_CONFIG_PP_SLM_VERTEX_LIMIT = "PP_SLM_VERTEX_LIMIT",
    AI_CONFIG_PP_LBW_MAX_WEIGHTS = "PP_LBW_MAX_WEIGHTS",
    AI_CONFIG_PP_DB_THRESHOLD = "PP_DB_THRESHOLD",
    AI_CONFIG_PP_DB_ALL_OR_NONE = "PP_DB_ALL_OR_NONE",
    AI_CONFIG_PP_ICL_PTCACHE_SIZE = "PP_ICL_PTCACHE_SIZE",
    AI_CONFIG_PP_RVC_FLAGS = "PP_RVC_FLAGS",
    AI_CONFIG_PP_SBP_REMOVE = "PP_SBP_REMOVE",
    AI_CONFIG_PP_FID_ANIM_ACCURACY = "PP_FID_ANIM_ACCURACY",
    AI_CONFIG_PP_TUV_EVALUATE = "PP_TUV_EVALUATE",
    AI_CONFIG_FAVOUR_SPEED = "FAVOUR_SPEED",
    AI_CONFIG_IMPORT_GLOBAL_KEYFRAME = "IMPORT_GLOBAL_KEYFRAME",
    AI_CONFIG_IMPORT_MD3_KEYFRAME = "IMPORT_MD3_KEYFRAME",
    AI_CONFIG_IMPORT_MD2_KEYFRAME = "IMPORT_MD2_KEYFRAME",
    AI_CONFIG_IMPORT_MDL_KEYFRAME = "IMPORT_MDL_KEYFRAME",
    AI_CONFIG_IMPORT_MDC_KEYFRAME = "IMPORT_MDC_KEYFRAME",
    AI_CONFIG_IMPORT_SMD_KEYFRAME = "IMPORT_SMD_KEYFRAME",
    AI_CONFIG_IMPORT_UNREAL_KEYFRAME = "AI_CONFIG_IMPORT_UNREAL_KEYFRAME",
    AI_CONFIG_IMPORT_AC_SEPARATE_BFCULL = "IMPORT_AC_SEPARATE_BFCULL",
    AI_CONFIG_IMPORT_AC_EVAL_SUBDIVISION = "IMPORT_AC_EVAL_SUBDIVISION",
    AI_CONFIG_IMPORT_UNREAL_HANDLE_FLAGS = "UNREAL_HANDLE_FLAGS",
    AI_CONFIG_IMPORT_TER_MAKE_UVS = "IMPORT_TER_MAKE_UVS",
    AI_CONFIG_IMPORT_ASE_RECONSTRUCT_NORMALS = "IMPORT_ASE_RECONSTRUCT_NORMALS",
    AI_CONFIG_IMPORT_MD3_HANDLE_MULTIPART = "IMPORT_MD3_HANDLE_MULTIPART",
    AI_CONFIG_IMPORT_MD3_SKIN_NAME = "IMPORT_MD3_SKIN_NAME",
    AI_CONFIG_IMPORT_MD3_SHADER_SRC = "IMPORT_MD3_SHADER_SRC",
    AI_CONFIG_IMPORT_LWO_ONE_LAYER_ONLY = "IMPORT_LWO_ONE_LAYER_ONLY",
    AI_CONFIG_IMPORT_MD5_NO_ANIM_AUTOLOAD = "IMPORT_MD5_NO_ANIM_AUTOLOAD",
    AI_CONFIG_IMPORT_LWS_ANIM_START = "IMPORT_LWS_ANIM_START",
    AI_CONFIG_IMPORT_LWS_ANIM_END = "IMPORT_LWS_ANIM_END",
    AI_CONFIG_IMPORT_IRR_ANIM_FPS = "IMPORT_IRR_ANIM_FPS",
    AI_CONFIG_IMPORT_OGRE_MATERIAL_FILE = "IMPORT_OGRE_MATERIAL_FILE",
    AI_CONFIG_IMPORT_OGRE_TEXTURETYPE_FROM_FILENAME = "IMPORT_OGRE_TEXTURETYPE_FROM_FILENAME",
    AI_CONFIG_IMPORT_IFC_SKIP_SPACE_REPRESENTATIONS = "IMPORT_IFC_SKIP_SPACE_REPRESENTATIONS",
    AI_CONFIG_IMPORT_IFC_SKIP_CURVE_REPRESENTATIONS = "IMPORT_IFC_SKIP_CURVE_REPRESENTATIONS",
    AI_CONFIG_IMPORT_IFC_CUSTOM_TRIANGULATION = "IMPORT_IFC_CUSTOM_TRIANGULATION",
}

enum AI_SBBC_DEFAULT_MAX_BONES = 60;
enum AI_SLM_DEFAULT_MAX_TRIANGLES = 1_000_000;
enum AI_SLM_DEFAULT_MAX_VERTICES = 1_000_000;
enum AI_LMW_MAX_WEIGHTS = 0x4;
enum AI_DEBONE_THRESHOLD = 1.0f;
enum PP_ICL_PTCACHE_SIZE = 12;
enum {
    AI_UVTRAFO_SCALING = 0x1,
    AI_UVTRAFO_ROTATION = 0x2,
    AI_UVTRAFO_TRANSLATION = 0x4,
    AI_UVTRAFO_ALL = AI_UVTRAFO_SCALING | AI_UVTRAFO_ROTATION | AI_UVTRAFO_TRANSLATION,
}


alias aiComponent = uint;
enum : uint {
    aiComponent_NORMALS = 0x2,
    aiComponent_TANGENTS_AND_BITANGENTS = 0x4,
    aiComponent_COLORS = 0x8,
    aiComponent_TEXCOORDS = 0x10,
    aiComponent_BONEWEIGHTS = 0x20,
    aiComponent_ANIMATIONS = 0x40,
    aiComponent_TEXTURES = 0x80,
    aiComponent_LIGHTS = 0x100,
    aiComponent_CAMERAS = 0x200,
    aiComponent_MESHES = 0x400,
    aiComponent_MATERIALS = 0x800,
}

uint aiComponent_COLORSn( uint n ) {
    return ( 1u << ( n+20u ));
}

uint aiComponent_TEXCOORDSn( uint n ) {
    return ( 1u << ( n+25u ));
}

// light.h
alias aiLightSourceType = uint;
enum : uint {
    aiLightSourceType_UNDEFINED = 0x0,
    aiLightSourceType_DIRECTIONAL = 0x1,
    aiLightSourceType_POINT = 0x2,
    aiLightSourceType_SPOT = 0x3,
}

struct aiLight {
    aiString mName;
    aiLightSourceType mType;
    aiVector3D mPosition;
    aiVector3D mDirection;
    float mAttenuationConstant;
    float mAttenuationLinear;
    float mAttenuationQuadratic;
    aiColor3D mColorDiffuse;
    aiColor3D mColorSpecular;
    aiColor3D mColorAmbient;
    float mAngleOuterCone;
}

// material.h
enum AI_DEFAULT_MATERIAL_NAME = "DefaultMaterial";

alias aiTextureOp = uint;
enum : uint {
    aiTextureOp_Multiply = 0x0,
    aiTextureOp_Add = 0x1,
    aiTextureOp_Subtract = 0x2,
    aiTextureOp_Divide = 0x3,
    aiTextureOp_SmoothAdd = 0x4,
    aiTextureOp_SignedAdd = 0x5,
}

alias aiTextureMapMode = uint;
enum : uint {
    aiTextureMapMode_Wrap = 0x0,
    aiTextureMapMode_Clamp = 0x1,
    aiTextureMapMode_Decal = 0x3,
    aiTextureMapMode_Mirror = 0x2,
}

alias aiTextureMapping = uint;
enum : uint {
    aiTextureMapping_UV = 0x0,
    aiTextureMapping_SPHERE = 0x1,
    aiTextureMapping_CYLINDER = 0x2,
    aiTextureMapping_BOX = 0x3,
    aiTextureMapping_PLANE = 0x4,
    aiTextureMapping_OTHER = 0x5,
}

alias aiTextureType = uint;
enum : uint {
    aiTextureType_NONE = 0x0,
    aiTextureType_DIFFUSE = 0x1,
    aiTextureType_SPECULAR = 0x2,
    aiTextureType_AMBIENT = 0x3,
    aiTextureType_EMISSIVE = 0x4,
    aiTextureType_HEIGHT = 0x5,
    aiTextureType_NORMALS = 0x6,
    aiTextureType_SHININESS = 0x7,
    aiTextureType_OPACITY = 0x8,
    aiTextureType_DISPLACEMENT = 0x9,
    aiTextureType_LIGHTMAP = 0xA,
    aiTextureType_REFLECTION = 0xB,
    aiTextureType_UNKNOWN = 0xC,
}

alias aiShadingMode = uint;
enum : uint {
    aiShadingMode_Flat = 0x1,
    aiShadingMode_Gouraud = 0x2,
    aiShadingMode_Phong = 0x3,
    aiShadingMode_Blinn = 0x4,
    aiShadingMode_Toon = 0x5,
    aiShadingMode_OrenNayer = 0x6,
    aiShadingMode_Minnaert =0x7,
    aiShadingMode_CookTorrance = 0x8,
    aiShadingMode_NoShading = 0x9,
    aiShadingMode_Fresnel = 0xA,
}

alias aiTextureFlags = uint;
enum : uint {
    aiTextureFlags_Invert = 0x1,
    aiTextureFlags_UseAlpha = 0x2,
    aiTextureFlags_IgnoreAlpha = 0x4,
}

alias aiBlendMode = uint;
enum : uint {
    aiBlendMode_Default = 0x0,
    aiBlendMode_Additive = 0x1,
}

align(1) struct aiUVTransform {
    aiVector2D mTranslation;
    aiVector2D mScaling;
}

alias aiPropertyTypeInfo = uint;
enum : uint {
    aiPTI_Float = 0x1,
    aiPTI_String = 0x3,
    aiPTI_Integer = 0x4,
    aiPTI_Buffer = 0x5,
}

struct aiMaterialProperty {
    aiString mKey;
    uint mSemantic;
    uint mIndex;
    uint mDataLength;
    aiPropertyTypeInfo mType;
    byte* mData;
}

struct aiMaterial {
    aiMaterialProperty** mProperties;
    uint mNumProperties;
    uint mNumAllocated;
}

enum {
    AI_MATKEY_NAME = "?mat.name",
    AI_MATKEY_TWOSIDED = "$mat.twosided",
    AI_MATKEY_SHADING_MODEL = "$mat.shadingm",
    AI_MATKEY_ENABLE_WIREFRAM = "$mat.wireframe",
    AI_MATKEY_BLEND_FUNC = "$mat.blend",
    AI_MATKEY_OPACITY = "$mat.opacity",
    AI_MATKEY_BUMPSCALING = "$mat.bumpscaling",
    AI_MATKEY_SHININESS = "$mat.shininess",
    AI_MATKEY_REFLECTIVITY = "$mat.reflectivity",
    AI_MATKEY_SHININESS_STRENGTH = "$mat.shinpercent",
    AI_MATKEY_REFRACTI = "$mat.refracti",
    AI_MATKEY_COLOR_DIFFUSE = "$clr.diffuse",
    AI_MATKEY_COLOR_AMBIENT = "$clr.ambient",
    AI_MATKEY_COLOR_SPECULAR = "$clr.specular",
    AI_MATKEY_COLOR_EMISSIVE = "$clr.emissive",
    AI_MATKEY_COLOR_TRANSPARENT = "$clr.transparent",
    AI_MATKEY_COLOR_REFLECTIVE = "$clr.reflective",
    AI_MATKEY_GLOBAL_BACKGROUND_IMAGE = "?bg.global",
    AI_MATKEY_TEXTURE = "$tex.file",
    AI_MATKEY_UVWSRC = "$tex.uvwsrc",
    AI_MATKEY_TEXOP = "$tex.op",
    AI_MATKEY_MAPPING = "$tex.mapping",
    AI_MATKEY_TEXBLEND = "$tex.blend",
    AI_MATKEY_MAPPINGMODE_U = "$tex.mapmodeu",
    AI_MATKEY_MAPPINGMODE_V = "$tex.mapmodev",
    AI_MATKEY_TEXMAP_AXIS = "$tex.mapaxis",
    AI_MATKEY_UVTRANSFORM = "$tex.uvtrafo",
    AI_MATKEY_TEXFLAGS = "$tex.flags",
}

// matrix3x3.h
align(1) struct aiMatrix3x3 {
    float a1, a2, a3;
    float b1, b2, b3;
    float c1, c2, c3;
}

// matrix4x4.h
struct aiMatrix4x4 {
    float a1, a2, a3, a4;
    float b1, b2, b3, b4;
    float c1, c2, c3, c4;
    float d1, d2, d3, d4;
}

// mesh.h
enum AI_MAX_FACE_INDICES = 0x7fff;
enum AI_MAX_BONE_WEIGHTS = 0x7fffffff;
enum AI_MAX_VERTICES = 0x7fffffff;
enum AI_MAX_FACES = 0x7fffffff;
enum AI_MAX_NUMBER_OF_COLOR_SETS = 0x8;
enum AI_MAX_NUMBER_OF_TEXTURECOORDS = 0x8;

struct aiFace {
    uint mNumIndices;
    uint* mIndices;
}

struct aiVertexWeight {
    uint mVertexId;
    float mWeight;
}

struct aiBone {
    aiString mName;
    uint mNumWeights;
    aiVertexWeight* mWeights;
    aiMatrix4x4 mOffsetMatrix;
}

alias aiPrimitiveType = uint;
enum : uint {
    aiPrimitiveType_POINT = 0x1,
    aiPrimitiveType_LINE = 0x2,
    aiPrimitiveType_TRIANGLE = 0x4,
    aiPrimitiveType_POLYGON = 0x8,

}

struct aiAnimMesh {
    aiVector3D* mVertices;
    aiVector3D* mNormals;
    aiVector3D* mTangents;
    aiVector3D* mBitangents;
    aiColor4D*[AI_MAX_NUMBER_OF_COLOR_SETS] mColors;
    aiVector3D*[AI_MAX_NUMBER_OF_TEXTURECOORDS] mTextureCoords;
    uint mNumVertices;
}

struct aiMesh {
    uint mPrimitiveTypes;
    uint mNumVertices;
    uint mNumFaces;
    aiVector3D* mVertices;
    aiVector3D* mNormals;
    aiVector3D* mTangents;
    aiVector3D* mBitangents;
    aiColor4D*[AI_MAX_NUMBER_OF_COLOR_SETS] mColors;
    aiVector3D*[AI_MAX_NUMBER_OF_TEXTURECOORDS] mTextureCoords;
    uint[AI_MAX_NUMBER_OF_TEXTURECOORDS] mNumUVComponents;
    aiFace* mFaces;
    uint mNumBones;
    aiBone** mBones;
    uint mMaterialIndex;
    aiString mName;
    uint mNumAnimMeshes;
    aiAnimMesh** mAnimMeshes;
}

// postprocess.h
alias aiPostProcessSteps = uint;
enum : uint {
    aiProcess_CalcTangentSpace = 0x1,
    aiProcess_JoinIdenticalVertices = 0x2,
    aiProcess_MakeLeftHanded = 0x4,
    aiProcess_Triangulate = 0x8,
    aiProcess_RemoveComponent = 0x10,
    aiProcess_GenNormals = 0x20,
    aiProcess_GenSmoothNormals = 0x40,
    aiProcess_SplitLargeMeshes = 0x80,
    aiProcess_PreTransformVertices = 0x100,
    aiProcess_LimitBoneWeights = 0x200,
    aiProcess_ValidateDataStructure = 0x400,
    aiProcess_ImproveCacheLocality = 0x800,
    aiProcess_RemoveRedundantMaterials = 0x1000,
    aiProcess_FixInFacingNormals = 0x2000,
    aiProcess_SortByPType = 0x8000,
    aiProcess_FindDegenerates = 0x10000,
    aiProcess_FindInvalidData = 0x20000,
    aiProcess_GenUVCoords = 0x40000,
    aiProcess_TransformUVCoords = 0x80000,
    aiProcess_FindInstances = 0x100000,
    aiProcess_OptimizeMeshes = 0x200000,
    aiProcess_OptimizeGraph = 0x400000,
    aiProcess_FlipUVs = 0x800000,
    aiProcess_FlipWindingOrder = 0x1000000,
    aiProcess_SplitByBoneCount = 0x2000000,
    aiProcess_Debone = 0x4000000,

    aiProcess_ConvertToLeftHanded = aiProcess_MakeLeftHanded | aiProcess_FlipUVs | aiProcess_FlipWindingOrder | 0,
    aiProcessPreset_TargetRealtime_Fast = aiProcess_CalcTangentSpace | aiProcess_GenNormals |
        aiProcess_JoinIdenticalVertices | aiProcess_Triangulate | aiProcess_GenUVCoords |
        aiProcess_SortByPType | 0,
    aiProcessPreset_TargetRealtime_Quality = aiProcess_CalcTangentSpace | aiProcess_GenSmoothNormals | aiProcess_JoinIdenticalVertices |
        aiProcess_ImproveCacheLocality | aiProcess_LimitBoneWeights | aiProcess_RemoveRedundantMaterials |
        aiProcess_SplitLargeMeshes | aiProcess_Triangulate | aiProcess_GenUVCoords | aiProcess_SortByPType |
        aiProcess_FindDegenerates | aiProcess_FindInvalidData | 0,
    aiProcessPreset_TargetRealtime_MaxQuality =
        aiProcessPreset_TargetRealtime_Quality |
        aiProcess_FindInstances | aiProcess_ValidateDataStructure |
        aiProcess_OptimizeMeshes | aiProcess_Debone | 0,
}

// quaternion.h
struct aiQuaternion {
    float w, x, y, z;
}

// vector2.h
struct aiVector2D {
    float x, y;
}

// vector3.h
align(1) struct aiVector3D {
    float x, y, z;
}

// scene.h
struct aiNode {
    aiString mName;
    aiMatrix4x4 mTransformation;
    aiNode* mParent;
    uint mNumChildren;
    aiNode** mChildren;
    uint mNumMeshes;
    uint* mMeshes;
}

enum {
    AI_SCENE_FLAGS_INCOMPLETE = 0x1,
    AI_SCENE_FLAGS_VALIDATED = 0x2,
    AI_SCENE_FLAGS_VALIDATION_WARNING = 0x4,
    AI_SCENE_FLAGS_NON_VERBOSE_FORMAT = 0x8,
    AI_SCENE_FLAGS_TERRAIN = 0x10,
}

struct aiScene {
    uint mFlags;
    aiNode* mRootNode;
    uint mNumMeshes;
    aiMesh** mMeshes;
    uint mNumMaterials;
    aiMaterial** mMaterials;
    uint mNumAnimations;
    aiAnimation** mAnimations;
    uint mNumTextures;
    aiTexture** mTexture;
    uint mNumLights;
    aiLight** mLights;
    uint mNumCameras;
    aiCamera** mCameras;
}

// texture.h
align(1) struct aiTexel {
    ubyte b, g, r, a;
}

struct aiTexture {
    uint mWidth;
    uint mHeight;
    char[4] achFormatHint;
    aiTexel* pcData;
}

// types.h
enum MAXLEN = 1024;

align(1) struct aiPlane {
    float a, b, c, d;
}

align(1) struct aiRay {
    aiVector3D pos, dir;
}

align(1) struct aiColor3D {
    float r, g, b;
}

struct aiString {
    size_t length;
    char data[MAXLEN];
}

alias aiReturn = int;
enum {
    aiReturn_SUCCESS = 0x0,
    aiReturn_FAILURE = -0x1,
    aiReturn_OUTOFMEMORY = -0x3,
}

alias aiOrigin = uint;
enum : uint {
    aiOrigin_SET = 0x0,
    aiOrigin_CUR = 0x1,
    aiOrigin_END = 0x2,
}

alias aiDefaultLogStream = uint;
enum : uint {
    aiDefaultLogStream_FILE = 0x1,
    aiDefaultLogStream_STDOUT = 0x2,
    aiDefaultLogStream_STDERR = 0x4,
    aiDefaultLogStream_DEBUGGER = 0x8,
}

struct aiMemoryInfo {
    uint textures;
    uint materials;
    uint meshes;
    uint nodes;
    uint animations;
    uint cameras;
    uint lights;
    uint total;
}

// version.h

enum  {
    ASSIMP_CFLAGS_SHARED = 0x1,
    ASSIMP_CFLAGS_STLPORT = 0x2,
    ASSIMP_CFLAGS_DEBUG = 0x4,
    ASSIMP_CFLAGS_NOBOOST = 0x8,
    ASSIMP_CFLAGS_SINGLETHREADED = 0x10,
}
