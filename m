Received: from mga06.intel.com (mga06b.intel.com [134.134.136.31])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 715EF3217;
	Mon, 10 Apr 2023 17:57:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1681149460; x=1712685460;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=GGZihadSCBgzCcdSKBrsS74hHB5H97zTUqXPQmXpWRE=;
  b=cmC+k5epsLQ/uBrSfjBetQqbpU9w8IsEBYPH6Qzvy54v7xWa26w5vh+4
   r25jk6OZJuppqmiLnMr/6w2YTwx9DPyU2WHIV7CjwwWspq0k1hrJmEz8f
   SMCCTLIRw6hf1TCSsUImIlu3ySjkjOdk1vJCeKK7srrl2zZYB5KoKFLWR
   V/7kofT7YjM7ix9sblc0elPES54XM3UGDCd97gfHI56aaYvJU2wFmKhV3
   AZWohZiRNSd3LZjCBVQuxHHQumiGkTWhWIknjfpobR7ct7IyJH22aNfv1
   VOcR5NJ2fkYI5duJpksfKY9eJ7R0Wq2OvWdQAIcTqkYp39YGnKwGUhPEH
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10676"; a="406247822"
X-IronPort-AV: E=Sophos;i="5.98,333,1673942400"; 
   d="scan'208";a="406247822"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
  by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Apr 2023 10:57:39 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10676"; a="799581024"
X-IronPort-AV: E=Sophos;i="5.98,333,1673942400"; 
   d="scan'208";a="799581024"
Received: from lkp-server01.sh.intel.com (HELO b613635ddfff) ([10.239.97.150])
  by fmsmga002.fm.intel.com with ESMTP; 10 Apr 2023 10:57:32 -0700
Received: from kbuild by b613635ddfff with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1plvlk-000VYf-07;
	Mon, 10 Apr 2023 17:57:32 +0000
Date: Tue, 11 Apr 2023 01:57:26 +0800
From: kernel test robot <lkp@intel.com>
To: Brandon Cheo Fusi <fusibrandon13@gmail.com>, maxime@cerno.tech
Cc: oe-kbuild-all@lists.linux.dev, airlied@gmail.com,
	andrzej.hajda@intel.com, daniel@ffwll.ch,
	dave.stevenson@raspberrypi.com, devicetree@vger.kernel.org,
	dri-devel@lists.freedesktop.org, jagan@amarulasolutions.com,
	jernej.skrabec@gmail.com, krzysztof.kozlowski+dt@linaro.org,
	linux-amarula@amarulasolutions.com,
	linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev,
	maarten.lankhorst@linux.intel.com, marex@denx.de,
	neil.armstrong@linaro.org, rfoss@kernel.org, robh+dt@kernel.org,
	sam@ravnborg.org, samuel@sholland.org, tzimmermann@suse.de,
	wens@csie.org, Brandon Cheo Fusi <fusibrandon13@gmail.com>
Subject: Re: [PATCH 1/2] drm: sun4i/dsi: factor out DSI PHY poweron and
 poweroff
Message-ID: <202304110110.ZLinpepn-lkp@intel.com>
References: <20230410084750.164016-2-fusibrandon13@gmail.com>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230410084750.164016-2-fusibrandon13@gmail.com>

Hi Brandon,

kernel test robot noticed the following build errors:

[auto build test ERROR on sunxi/sunxi/for-next]
[also build test ERROR on linus/master v6.3-rc6 next-20230406]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Brandon-Cheo-Fusi/drm-sun4i-dsi-factor-out-DSI-PHY-poweron-and-poweroff/20230410-165257
base:   https://git.kernel.org/pub/scm/linux/kernel/git/sunxi/linux.git sunxi/for-next
patch link:    https://lore.kernel.org/r/20230410084750.164016-2-fusibrandon13%40gmail.com
patch subject: [PATCH 1/2] drm: sun4i/dsi: factor out DSI PHY poweron and poweroff
config: ia64-allyesconfig (https://download.01.org/0day-ci/archive/20230411/202304110110.ZLinpepn-lkp@intel.com/config)
compiler: ia64-linux-gcc (GCC) 12.1.0
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://github.com/intel-lab-lkp/linux/commit/afa9cb6821e4527f07c10a777ea44e380b524858
        git remote add linux-review https://github.com/intel-lab-lkp/linux
        git fetch --no-tags linux-review Brandon-Cheo-Fusi/drm-sun4i-dsi-factor-out-DSI-PHY-poweron-and-poweroff/20230410-165257
        git checkout afa9cb6821e4527f07c10a777ea44e380b524858
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=ia64 olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=ia64 SHELL=/bin/bash drivers/gpu/

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202304110110.ZLinpepn-lkp@intel.com/

All errors (new ones prefixed by >>):

>> drivers/gpu/drm/sun4i/sun6i_mipi_dsi.c:843:27: error: initialization of 'void (*)(struct drm_encoder *)' from incompatible pointer type 'void (*)(struct drm_encoder *, struct drm_atomic_state *)' [-Werror=incompatible-pointer-types]
     843 |         .enable         = sun6i_dsi_encoder_enable,
         |                           ^~~~~~~~~~~~~~~~~~~~~~~~
   drivers/gpu/drm/sun4i/sun6i_mipi_dsi.c:843:27: note: (near initialization for 'sun6i_dsi_enc_helper_funcs.enable')
   cc1: some warnings being treated as errors


vim +843 drivers/gpu/drm/sun4i/sun6i_mipi_dsi.c

133add5b5ad42b Maxime Ripard 2018-04-04  841  
133add5b5ad42b Maxime Ripard 2018-04-04  842  static const struct drm_encoder_helper_funcs sun6i_dsi_enc_helper_funcs = {
133add5b5ad42b Maxime Ripard 2018-04-04 @843  	.enable		= sun6i_dsi_encoder_enable,
133add5b5ad42b Maxime Ripard 2018-04-04  844  };
133add5b5ad42b Maxime Ripard 2018-04-04  845  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
