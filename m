Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E737F43C3
	for <linux-sunxi@lists.linux.dev>; Thu, 23 Jun 2022 02:00:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1655949609; x=1687485609;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=KbeXCVtz+edFvopo5p5QoDn9huAgw0qHkMWWoFBLhXA=;
  b=KR8w1PUgKSLgaQPqpLhfqiVVBLLUe5PHjl3diWqe9Z157DkPnuErwpco
   sdluAzxA3r7qGDbbP464d56i3mvhAkhIGB2JcHzL20k9wTyoLSb+y6Nd8
   nIYkDkyervxkQIx62+mKNwTDsJwPnfG1Eq6+mFsRNRiJ1XrkJSDhV6rOF
   ZZhdLZVwlDfWhqhrQGLNTvEKS+TGBk8vKSUZKKLMqrMQDgnWx6vgTyxvc
   1bbQNCqBlA7MvPpSV8Rc+kBt/MiNSRnpegcck61sMZzR39PDc/Ls903wF
   PjUQASwLGmsRGPD0HaMCfXtkQ0dHgWpCwAibRrDEEeNv6orSG580xk+0V
   Q==;
X-IronPort-AV: E=McAfee;i="6400,9594,10386"; a="280645178"
X-IronPort-AV: E=Sophos;i="5.92,215,1650956400"; 
   d="scan'208";a="280645178"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
  by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Jun 2022 19:00:09 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.92,215,1650956400"; 
   d="scan'208";a="615398908"
Received: from lkp-server01.sh.intel.com (HELO 68b931ab7ac1) ([10.239.97.150])
  by orsmga008.jf.intel.com with ESMTP; 22 Jun 2022 19:00:02 -0700
Received: from kbuild by 68b931ab7ac1 with local (Exim 4.95)
	(envelope-from <lkp@intel.com>)
	id 1o4C8X-0000LT-BJ;
	Thu, 23 Jun 2022 02:00:01 +0000
Date: Thu, 23 Jun 2022 09:59:06 +0800
From: kernel test robot <lkp@intel.com>
To: Charles Keepax <ckeepax@opensource.cirrus.com>, broonie@kernel.org
Cc: kbuild-all@lists.01.org, lgirdwood@gmail.com,
	kuninori.morimoto.gx@renesas.com, mripard@kernel.org,
	airlied@linux.ie, daniel@ffwll.ch, vkoul@kernel.org,
	nicolas.ferre@microchip.com, nsaenz@kernel.org, shawnguo@kernel.org,
	linux-imx@nxp.com, cezary.rojewski@intel.com,
	pierre-louis.bossart@linux.intel.com, linux-mips@vger.kernel.org,
	linux-amlogic@lists.infradead.org, daniel@zonque.org,
	srinivas.kandagatla@linaro.org, linux-rockchip@lists.infradead.org,
	krzk@kernel.org, linux-stm32@st-md-mailman.stormreply.com,
	linux-sunxi@lists.linux.dev, linux-tegra@vger.kernel.org,
	linux-omap@vger.kernel.org, linux-xtensa@linux-xtensa.org,
	peter.ujfalusi@gmail.com, jarkko.nikula@bitmer.com, heiko@sntech.de,
	jbrunet@baylibre.com, kernel@pengutronix.de,
	alsa-devel@alsa-project.org
Subject: Re: [PATCH 27/96] ASoC: au1x: Migrate to new style legacy DAI naming
 flag
Message-ID: <202206230910.wUXKFP3z-lkp@intel.com>
References: <20220616143429.1324494-28-ckeepax@opensource.cirrus.com>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220616143429.1324494-28-ckeepax@opensource.cirrus.com>

Hi Charles,

I love your patch! Yet something to improve:

[auto build test ERROR on broonie-sound/for-next]
[also build test ERROR on tegra/for-next sunxi/sunxi/for-next linus/master v5.19-rc3 next-20220622]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch]

url:    https://github.com/intel-lab-lkp/linux/commits/Charles-Keepax/Refactor-non_legacy_dai_naming-flag/20220616-224300
base:   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next
config: mips-db1xxx_defconfig (https://download.01.org/0day-ci/archive/20220623/202206230910.wUXKFP3z-lkp@intel.com/config)
compiler: mipsel-linux-gcc (GCC) 11.3.0
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://github.com/intel-lab-lkp/linux/commit/794205d61285d0921e564e722daf9b20df82ed57
        git remote add linux-review https://github.com/intel-lab-lkp/linux
        git fetch --no-tags linux-review Charles-Keepax/Refactor-non_legacy_dai_naming-flag/20220616-224300
        git checkout 794205d61285d0921e564e722daf9b20df82ed57
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-11.3.0 make.cross W=1 O=build_dir ARCH=mips SHELL=/bin/bash sound/soc/au1x/

If you fix the issue, kindly add following tag where applicable
Reported-by: kernel test robot <lkp@intel.com>

All error/warnings (new ones prefixed by >>):

>> sound/soc/au1x/ac97c.c:227:10: error: 'const struct snd_soc_component_driver' has no member named 'legacy_dai_name'; did you mean 'legacy_dai_naming'?
     227 |         .legacy_dai_name        = 1,
         |          ^~~~~~~~~~~~~~~
         |          legacy_dai_naming
>> sound/soc/au1x/ac97c.c:227:35: warning: initialization of 'const struct snd_kcontrol_new *' from 'int' makes pointer from integer without a cast [-Wint-conversion]
     227 |         .legacy_dai_name        = 1,
         |                                   ^
   sound/soc/au1x/ac97c.c:227:35: note: (near initialization for 'au1xac97c_component.controls')


vim +227 sound/soc/au1x/ac97c.c

   224	
   225	static const struct snd_soc_component_driver au1xac97c_component = {
   226		.name			= "au1xac97c",
 > 227		.legacy_dai_name	= 1,
   228	};
   229	

-- 
0-DAY CI Kernel Test Service
https://01.org/lkp
