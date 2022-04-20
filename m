Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5AD531365
	for <linux-sunxi@lists.linux.dev>; Wed, 20 Apr 2022 09:10:40 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4E3B8C385A1;
	Wed, 20 Apr 2022 09:10:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1650445840;
	bh=9MV5jDT7yaxD0Y/INx8ZEMUimUtMRYELWJFX5EOCeVc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=j9sd9Eic1kwq3VkW1SHvpdM2kSxxtlfhAPnpHtfgL/V58AcSPr3xgikyF+pm3Hea7
	 rNCd6SRT1UfIYBRWvio6p6STbH9/QkxBroqTzk4Jyt2Gi7WE/tCg5+itkXmjh7n0yw
	 9L6ksgAvuwj8lzBc+OHzFQhhcXV3BDIVDPX9RQazYZzgl+a4ljhT9VbMiaDvRrkmqb
	 iR/3YwsMxQFf80hwdIUquLUBDLqc9lnomCa3zUYIDziiwpFyyo+NxUsfMvzwznmxzY
	 lT6QvHB5/JBIeFU9aQfytI11Hc7rUCIILHY97EfKhUGX8kLZwNaKzvQiPaW3TcyKLU
	 r6pCYb/0FFV3A==
Date: Wed, 20 Apr 2022 14:40:35 +0530
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
	Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
	Rob Herring <robh@kernel.org>
Subject: Re: [PATCH v4 1/8] dt-bindings: sun6i-a31-mipi-dphy: Add optional
 direction property
Message-ID: <Yl/OC4p93E2HiG3m@matsya>
References: <20220415152138.635525-1-paul.kocialkowski@bootlin.com>
 <20220415152138.635525-2-paul.kocialkowski@bootlin.com>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220415152138.635525-2-paul.kocialkowski@bootlin.com>

On 15-04-22, 17:21, Paul Kocialkowski wrote:
> The Allwinner A31 MIPI D-PHY block supports both tx and rx directions,
> although each instance of the block is meant to be used in one
> direction only. There will typically be one instance for MIPI DSI and
> one for MIPI CSI-2 (it seems unlikely to ever see a shared instance).
> 
> Describe the direction with a new allwinner,direction property.
> For backwards compatibility, the property is optional and tx mode
> should be assumed by default.

Applied to phy-next, thanks

-- 
~Vinod
