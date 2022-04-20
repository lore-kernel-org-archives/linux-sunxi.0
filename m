Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2CEA71365
	for <linux-sunxi@lists.linux.dev>; Wed, 20 Apr 2022 09:10:57 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1C3DAC385A8;
	Wed, 20 Apr 2022 09:10:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1650445856;
	bh=vNmwPpTDyLDXQ55olkDm+ZCj59k9TpDmHMa62vxoowk=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=ZHfJeU0n79x4oll/Q7f/9VpvYChLshtc9wn0U28VqBpa0tptSYx2N38tNDICIL5Dt
	 sERo+URpYLsAqjLCb6rr1IpkfrQb5psB1yGo9kpyfhujS4HQQxdLYiILC2wBiEqCxL
	 oYD+u5E65uNpwqXsx4a60SXlTR/+Wkq09zVNTwRMp9yA6jhnzYYXwlZSjdHKtdJ6xe
	 UoRmO9i9Dx4L9VoBJpz/UIp2VeitcqzZgalYNJmvU9zdmXw5mEzMqtbMCPv3tj3dAi
	 x45ovcVr8JnNsawhraeGrm90N7PhmmFlDzcC8LQR+EDoWA1HaHssu5g2uyF8pNroQW
	 DWyU44VRN/4MQ==
Date: Wed, 20 Apr 2022 14:40:52 +0530
From: Vinod Koul <vkoul@kernel.org>
To: Paul Kocialkowski <paul.kocialkowski@bootlin.com>
Cc: linux-media@vger.kernel.org, devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev,
	linux-kernel@vger.kernel.org, linux-phy@lists.infradead.org,
	Yong Deng <yong.deng@magewell.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Rob Herring <robh+dt@kernel.org>, Chen-Yu Tsai <wens@csie.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Samuel Holland <samuel@sholland.org>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	Hans Verkuil <hans.verkuil@cisco.com>,
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	Kishon Vijay Abraham I <kishon@ti.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Subject: Re: [PATCH v4 2/8] phy: allwinner: phy-sun6i-mipi-dphy: Support
 D-PHY Rx mode for MIPI CSI-2
Message-ID: <Yl/OHEKqLR0gwHzW@matsya>
References: <20220415152138.635525-1-paul.kocialkowski@bootlin.com>
 <20220415152138.635525-3-paul.kocialkowski@bootlin.com>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220415152138.635525-3-paul.kocialkowski@bootlin.com>

On 15-04-22, 17:21, Paul Kocialkowski wrote:
> The Allwinner A31 D-PHY supports both Rx and Tx modes. While the latter
> is already supported and used for MIPI DSI this adds support for the
> former, to be used with MIPI CSI-2.
> 
> This implementation is inspired by Allwinner's V3s Linux SDK
> implementation, which was used as a documentation base.
> 
> It uses the direction dt property to distinguish between tx and rx
> directions.

Applied to phy-next, thanks

-- 
~Vinod
