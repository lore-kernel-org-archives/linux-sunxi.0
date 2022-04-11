Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DAC311840
	for <linux-sunxi@lists.linux.dev>; Mon, 11 Apr 2022 12:04:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1649678644; x=1681214644;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=o3dD+/n6JyhaejWNWTKICDnSKZHjfajSAJG8ZEeyBzY=;
  b=dj/LML8pkhmT45dRNi1sW/jvk5xuWgTLsBkxdja1J8OxdGunOKRPMEsu
   LQeOufkeohZUIMZ9NVfJEK1nVQ75DvIUZ3B2n90CjmCNpulIk2chEoYuC
   +JU0WKw8yPbp21Gl5fPUTzvL4Pv3WUVU0wM79gI5DipDTevVVKpKVEBdf
   X2cNWpQM70hbtzloV+BekDCItbuH9tkKw7eeroqF07VfEuF463r1NuXnH
   UryHmlUN94cf+J5loWs+jY4cVIyJ5uaAWhzMoNGWS5+R2fk6+FK+HF2tx
   hCmyJu8BiHIWzVTZVjCQvYN4O/NyBZI9ATImkOZd9Tmr7VSeSyyKR7Wv/
   A==;
X-IronPort-AV: E=McAfee;i="6400,9594,10313"; a="348535940"
X-IronPort-AV: E=Sophos;i="5.90,251,1643702400"; 
   d="scan'208";a="348535940"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
  by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Apr 2022 05:04:01 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.90,251,1643702400"; 
   d="scan'208";a="699347471"
Received: from lkp-server02.sh.intel.com (HELO d3fc50ef50de) ([10.239.97.151])
  by fmsmga001.fm.intel.com with ESMTP; 11 Apr 2022 05:03:58 -0700
Received: from kbuild by d3fc50ef50de with local (Exim 4.95)
	(envelope-from <lkp@intel.com>)
	id 1ndslx-0001pL-T7;
	Mon, 11 Apr 2022 12:03:57 +0000
Date: Mon, 11 Apr 2022 20:03:46 +0800
From: kernel test robot <lkp@intel.com>
To: Samuel Holland <samuel@sholland.org>, Vinod Koul <vkoul@kernel.org>,
	dmaengine@vger.kernel.org
Cc: kbuild-all@lists.01.org, Samuel Holland <samuel@sholland.org>,
	Chen-Yu Tsai <wens@csie.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Krzysztof Kozlowski <krzk@kernel.org>,
	Maxime Ripard <mripard@kernel.org>,
	Rob Herring <robh+dt@kernel.org>, devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	linux-sunxi@lists.linux.dev
Subject: Re: [PATCH v2 3/4] dmaengine: sun6i: Add support for 34-bit physical
 addresses
Message-ID: <202204111937.ZQ1e600D-lkp@intel.com>
References: <20220411044633.39014-4-samuel@sholland.org>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220411044633.39014-4-samuel@sholland.org>
User-Agent: Mutt/1.10.1 (2018-07-13)

Hi Samuel,

I love your patch! Perhaps something to improve:

[auto build test WARNING on vkoul-dmaengine/next]
[also build test WARNING on sunxi/sunxi/for-next v5.18-rc2 next-20220411]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch]

url:    https://github.com/intel-lab-lkp/linux/commits/Samuel-Holland/dmaengine-sun6i-Allwinner-D1-support/20220411-124826
base:   https://git.kernel.org/pub/scm/linux/kernel/git/vkoul/dmaengine.git next
config: nios2-randconfig-r011-20220410 (https://download.01.org/0day-ci/archive/20220411/202204111937.ZQ1e600D-lkp@intel.com/config)
compiler: nios2-linux-gcc (GCC) 11.2.0
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://github.com/intel-lab-lkp/linux/commit/2e9c7977b871d504bca4e9ee88d3b322a21f3fb7
        git remote add linux-review https://github.com/intel-lab-lkp/linux
        git fetch --no-tags linux-review Samuel-Holland/dmaengine-sun6i-Allwinner-D1-support/20220411-124826
        git checkout 2e9c7977b871d504bca4e9ee88d3b322a21f3fb7
        # save the config file to linux build tree
        mkdir build_dir
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-11.2.0 make.cross O=build_dir ARCH=nios2 SHELL=/bin/bash drivers/dma/

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>

All warnings (new ones prefixed by >>):

   In file included from include/linux/device.h:15,
                    from include/linux/dmaengine.h:8,
                    from drivers/dma/sun6i-dma.c:12:
   drivers/dma/sun6i-dma.c: In function 'sun6i_dma_dump_chan_regs':
   drivers/dma/sun6i-dma.c:259:34: warning: format '%lx' expects argument of type 'long unsigned int', but argument 5 has type 'int' [-Wformat=]
     259 |         dev_dbg(sdev->slave.dev, "Chan %d reg: 0x%lx\n"
         |                                  ^~~~~~~~~~~~~~~~~~~~~~
   include/linux/dev_printk.h:129:41: note: in definition of macro 'dev_printk'
     129 |                 _dev_printk(level, dev, fmt, ##__VA_ARGS__);            \
         |                                         ^~~
   include/linux/dev_printk.h:158:37: note: in expansion of macro 'dev_fmt'
     158 |         dev_printk(KERN_DEBUG, dev, dev_fmt(fmt), ##__VA_ARGS__)
         |                                     ^~~~~~~
   drivers/dma/sun6i-dma.c:259:9: note: in expansion of macro 'dev_dbg'
     259 |         dev_dbg(sdev->slave.dev, "Chan %d reg: 0x%lx\n"
         |         ^~~~~~~
   drivers/dma/sun6i-dma.c:259:52: note: format string is defined here
     259 |         dev_dbg(sdev->slave.dev, "Chan %d reg: 0x%lx\n"
         |                                                  ~~^
         |                                                    |
         |                                                    long unsigned int
         |                                                  %x
   drivers/dma/sun6i-dma.c: In function 'sun6i_dma_prep_dma_memcpy':
>> drivers/dma/sun6i-dma.c:99:48: warning: right shift count >= width of type [-Wshift-count-overflow]
      99 | #define SET_SRC_HIGH_ADDR(x)            ((((x) >> 32) & 0x3U) << 16)
         |                                                ^~
   drivers/dma/sun6i-dma.c:674:32: note: in expansion of macro 'SET_SRC_HIGH_ADDR'
     674 |                 v_lli->para |= SET_SRC_HIGH_ADDR(src) |
         |                                ^~~~~~~~~~~~~~~~~
   drivers/dma/sun6i-dma.c:100:48: warning: right shift count >= width of type [-Wshift-count-overflow]
     100 | #define SET_DST_HIGH_ADDR(x)            ((((x) >> 32) & 0x3U) << 18)
         |                                                ^~
   drivers/dma/sun6i-dma.c:675:32: note: in expansion of macro 'SET_DST_HIGH_ADDR'
     675 |                                SET_DST_HIGH_ADDR(dest);
         |                                ^~~~~~~~~~~~~~~~~
   drivers/dma/sun6i-dma.c: In function 'sun6i_dma_prep_slave_sg':
>> drivers/dma/sun6i-dma.c:99:48: warning: right shift count >= width of type [-Wshift-count-overflow]
      99 | #define SET_SRC_HIGH_ADDR(x)            ((((x) >> 32) & 0x3U) << 16)
         |                                                ^~
   drivers/dma/sun6i-dma.c:737:48: note: in expansion of macro 'SET_SRC_HIGH_ADDR'
     737 |                                 v_lli->para |= SET_SRC_HIGH_ADDR(sg_dma_address(sg)) |
         |                                                ^~~~~~~~~~~~~~~~~
   drivers/dma/sun6i-dma.c:100:48: warning: right shift count >= width of type [-Wshift-count-overflow]
     100 | #define SET_DST_HIGH_ADDR(x)            ((((x) >> 32) & 0x3U) << 18)
         |                                                ^~
   drivers/dma/sun6i-dma.c:738:48: note: in expansion of macro 'SET_DST_HIGH_ADDR'
     738 |                                                SET_DST_HIGH_ADDR(sconfig->dst_addr);
         |                                                ^~~~~~~~~~~~~~~~~
>> drivers/dma/sun6i-dma.c:99:48: warning: right shift count >= width of type [-Wshift-count-overflow]
      99 | #define SET_SRC_HIGH_ADDR(x)            ((((x) >> 32) & 0x3U) << 16)
         |                                                ^~
   drivers/dma/sun6i-dma.c:753:48: note: in expansion of macro 'SET_SRC_HIGH_ADDR'
     753 |                                 v_lli->para |= SET_SRC_HIGH_ADDR(sconfig->src_addr) |
         |                                                ^~~~~~~~~~~~~~~~~
   drivers/dma/sun6i-dma.c:100:48: warning: right shift count >= width of type [-Wshift-count-overflow]
     100 | #define SET_DST_HIGH_ADDR(x)            ((((x) >> 32) & 0x3U) << 18)
         |                                                ^~
   drivers/dma/sun6i-dma.c:754:48: note: in expansion of macro 'SET_DST_HIGH_ADDR'
     754 |                                                SET_DST_HIGH_ADDR(sg_dma_address(sg));
         |                                                ^~~~~~~~~~~~~~~~~
   drivers/dma/sun6i-dma.c: In function 'sun6i_dma_prep_dma_cyclic':
>> drivers/dma/sun6i-dma.c:99:48: warning: right shift count >= width of type [-Wshift-count-overflow]
      99 | #define SET_SRC_HIGH_ADDR(x)            ((((x) >> 32) & 0x3U) << 16)
         |                                                ^~
   drivers/dma/sun6i-dma.c:826:48: note: in expansion of macro 'SET_SRC_HIGH_ADDR'
     826 |                                 v_lli->para |= SET_SRC_HIGH_ADDR(buf_addr + period_len * i) |
         |                                                ^~~~~~~~~~~~~~~~~
   drivers/dma/sun6i-dma.c:100:48: warning: right shift count >= width of type [-Wshift-count-overflow]
     100 | #define SET_DST_HIGH_ADDR(x)            ((((x) >> 32) & 0x3U) << 18)
         |                                                ^~
   drivers/dma/sun6i-dma.c:827:48: note: in expansion of macro 'SET_DST_HIGH_ADDR'
     827 |                                                SET_DST_HIGH_ADDR(sconfig->dst_addr);
         |                                                ^~~~~~~~~~~~~~~~~
>> drivers/dma/sun6i-dma.c:99:48: warning: right shift count >= width of type [-Wshift-count-overflow]
      99 | #define SET_SRC_HIGH_ADDR(x)            ((((x) >> 32) & 0x3U) << 16)
         |                                                ^~
   drivers/dma/sun6i-dma.c:835:48: note: in expansion of macro 'SET_SRC_HIGH_ADDR'
     835 |                                 v_lli->para |= SET_SRC_HIGH_ADDR(sconfig->src_addr) |
         |                                                ^~~~~~~~~~~~~~~~~
   drivers/dma/sun6i-dma.c:100:48: warning: right shift count >= width of type [-Wshift-count-overflow]
     100 | #define SET_DST_HIGH_ADDR(x)            ((((x) >> 32) & 0x3U) << 18)
         |                                                ^~
   drivers/dma/sun6i-dma.c:836:48: note: in expansion of macro 'SET_DST_HIGH_ADDR'
     836 |                                                SET_DST_HIGH_ADDR(buf_addr + period_len * i);
         |                                                ^~~~~~~~~~~~~~~~~


vim +99 drivers/dma/sun6i-dma.c

    92	
    93	/*
    94	 * LLI address mangling
    95	 *
    96	 * The LLI link physical address is also mangled, but we avoid dealing
    97	 * with that by allocating LLIs from the DMA32 zone.
    98	 */
  > 99	#define SET_SRC_HIGH_ADDR(x)		((((x) >> 32) & 0x3U) << 16)
   100	#define SET_DST_HIGH_ADDR(x)		((((x) >> 32) & 0x3U) << 18)
   101	

-- 
0-DAY CI Kernel Test Service
https://01.org/lkp
