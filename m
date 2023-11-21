Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.31])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 372A61EA8A
	for <linux-sunxi@lists.linux.dev>; Tue, 21 Nov 2023 08:58:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="VhzGYvXO"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1700557110; x=1732093110;
  h=from:to:cc:subject:in-reply-to:references:date:
   message-id:mime-version;
  bh=htt+X8f+FjchoXwuJTnW2vNFwbgd57Lg5mit0MjBw8w=;
  b=VhzGYvXOFGZ/rMG9TUktlRq2R3IRWQKrrKTs3Cmb1fS1jOcZQ4q5mjea
   2mnd3TxvRHgRzK4Ts/QsQ5PTWefufkfOoRIUBSRdfuhAdpYQnEUIiifTE
   dbBq8KJxdjqTzTAWLWx3Rn7UBmCe4vObKvqgHFYuQnBdSLA3k575nTu3v
   OXgKrt40+rOEVKWL991chxf1bcxxtwNNjzxzKb4B84LXRBxUeQIP75pHk
   16IJhozxQvjKNKIxPWAikd+zou6yi9DLBRcGEZcQzM+v29OWfq2eb4eTU
   rdCpnsuv5y4KBbzA0GXtKwkKqjE2bO1sQEFd2LKSqC6isOpIMiMi6CfdX
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10900"; a="456132996"
X-IronPort-AV: E=Sophos;i="6.04,215,1695711600"; 
   d="scan'208";a="456132996"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
  by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Nov 2023 00:58:28 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10900"; a="890195495"
X-IronPort-AV: E=Sophos;i="6.04,215,1695711600"; 
   d="scan'208";a="890195495"
Received: from cdeakx-mobl.amr.corp.intel.com (HELO localhost) ([10.252.58.54])
  by orsmga004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Nov 2023 00:58:23 -0800
From: Jani Nikula <jani.nikula@linux.intel.com>
To: Heiner Kallweit <hkallweit1@gmail.com>, Wolfram Sang <wsa@kernel.org>,
 intel-gfx@lists.freedesktop.org
Cc: linux-fbdev@vger.kernel.org, dri-devel@lists.freedesktop.org, Yongqin
 Liu <yongqin.liu@linaro.org>, Jernej Skrabec <jernej.skrabec@gmail.com>,
 Marijn Suijten <marijn.suijten@somainline.org>, Sumit Semwal
 <sumit.semwal@linaro.org>, amd-gfx@lists.freedesktop.org,
 linux-rockchip@lists.infradead.org, Xinwei Kong
 <kong.kongxinwei@hisilicon.com>, linux-sunxi@lists.linux.dev, Jonas
 Karlman <jonas@kwiboo.se>, linux-arm-msm@vger.kernel.org,
 linux-mediatek@lists.infradead.org, linux-arm-kernel@lists.infradead.org,
 Jocelyn Falempe <jfalempe@redhat.com>, linux-kernel@vger.kernel.org,
 linux-i2c@vger.kernel.org, Thomas Zimmermann <tzimmermann@suse.de>, John
 Stultz <jstultz@google.com>, Heiner Kallweit <hkallweit1@gmail.com>,
 freedreno@lists.freedesktop.org, Laurent Pinchart
 <Laurent.pinchart@ideasonboard.com>
Subject: Re: [Intel-gfx] [PATCH v4 00/20] remove I2C_CLASS_DDC support
In-Reply-To: <20231120214624.9378-1-hkallweit1@gmail.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
References: <20231120214624.9378-1-hkallweit1@gmail.com>
Date: Tue, 21 Nov 2023 10:58:20 +0200
Message-ID: <87h6lfo53n.fsf@intel.com>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain

On Mon, 20 Nov 2023, Heiner Kallweit <hkallweit1@gmail.com> wrote:
> v4:
> - more ack and review tags

Please do not send new versions just to record the acks and
reviews. They should be added while applying the patches.

Thanks,
Jani.

-- 
Jani Nikula, Intel
