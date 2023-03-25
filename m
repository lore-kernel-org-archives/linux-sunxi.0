Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8A5273C27
	for <linux-sunxi@lists.linux.dev>; Sat, 25 Mar 2023 20:19:50 +0000 (UTC)
Received: from pendragon.ideasonboard.com (213-243-189-158.bb.dnainternet.fi [213.243.189.158])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 1DBDA89F;
	Sat, 25 Mar 2023 21:19:48 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1679775588;
	bh=t9Gm2qg6/V2UGvpZMwAY3Fw5/d2Aa94eWo39errrAao=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=IItCIk+5v2CF1NaP0YvkhWL4UibVN39HI9AyBpMExOjdnDVJKSuVOBMl7ZjKCCxQo
	 DN7IRwUrBJveGSG9OOMiz5BSr+Evmx5Rl3Bx0QQYeEK06dUtoC+6BbbkD6TsyhQ8mk
	 ShzSvsQ2vFgBYrxwNK7uKNH69NOsWT2AqqfrVdJ4=
Date: Sat, 25 Mar 2023 22:19:54 +0200
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: linux-media@vger.kernel.org
Cc: linux-sunxi@lists.linux.dev, Yong Deng <yong.deng@magewell.com>,
	Paul Kocialkowski <paul.kocialkowski@bootlin.com>,
	Adam Pigg <adam@piggz.co.uk>
Subject: Re: [PATCH v1 0/2] media: sun6i-csi: Fix format propagation in bridge
Message-ID: <20230325201954.GA17021@pendragon.ideasonboard.com>
References: <20230104162215.31194-1-laurent.pinchart@ideasonboard.com>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20230104162215.31194-1-laurent.pinchart@ideasonboard.com>

Hi Paul,

Ping for a review. I'd like to get this in v6.4.

On Wed, Jan 04, 2023 at 06:22:13PM +0200, Laurent Pinchart wrote:
> Hello,
> 
> This small patch series fixes format propagation in the sun6i-csi-bridge
> subdev from sink pad to source pad. In order to do so, it uses the V4L2
> subdev active state provided by the V4L2 subdev core (patch 2/2), with a
> preparatory patch (1/2) that drops direct access to the bridge fields
> from the capture side.
> 
> I haven't tested the patches myself as I lack a hardware platform for
> this, but Adam (on CC) has successfully tested them. Adam, if you want
> to reply with a Tested-by tag, that would be appreciated.
> 
> Laurent Pinchart (2):
>   media: sun6i-csi: capture: Use subdev operation to access bridge
>     format
>   media: sun6i-csi: subdev: Use subdev active state to store active
>     format
> 
>  .../sunxi/sun6i-csi/sun6i_csi_bridge.c        | 211 ++++++++----------
>  .../sunxi/sun6i-csi/sun6i_csi_bridge.h        |   9 -
>  .../sunxi/sun6i-csi/sun6i_csi_capture.c       |  23 +-
>  3 files changed, 110 insertions(+), 133 deletions(-)
> 
> 
> base-commit: 6599e683db1bf22fee74302c47e31b9a42a1c3d2

-- 
Regards,

Laurent Pinchart
