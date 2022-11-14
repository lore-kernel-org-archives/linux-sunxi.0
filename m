Received: from lahtoruutu.iki.fi (lahtoruutu.iki.fi [185.185.170.37])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 31444256D
	for <linux-sunxi@lists.linux.dev>; Mon, 14 Nov 2022 10:06:51 +0000 (UTC)
Received: from hillosipuli.retiisi.eu (dkxjnptf9d2bpn7gcmbty-3.rev.dnainternet.fi [IPv6:2001:14ba:44ce:b640:9d1d:82c5:eca2:5060])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: sailus)
	by lahtoruutu.iki.fi (Postfix) with ESMTPSA id E40E31B00120;
	Mon, 14 Nov 2022 12:06:42 +0200 (EET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=iki.fi; s=lahtoruutu;
	t=1668420403;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=n0E8YgTPeMlZaTVJH+p1nlFsfAcKuXhV2rFQ22qn48c=;
	b=MuhPojJumg96qXDDlbrabUiYNYg8DcQZv1EJSsFMyIF6MyW0Vh+8sEnczpe+aD3M62my47
	aIFsa8W8vIIWUFPOMph2ODZyvcz3wi4rEfazTeXTOc2gp5bHj/NBnAel+JHLpGJpRgy5mp
	Kna6eH8mRIg4fMu98Lbx/y23F97XEoqNym1cR/3+EV4bXTjujS24MGECr21SbrhQMglJve
	N5zTfaNew1/qt182IHViBRdU2ygu2SzXNBeB/G+C7rdG2fwxmwAuTomnuIxcOsq5ufMxaO
	gIFl/MKK4NF7eoOUDhNaiQ54xMnbQIJf8FzsKHwnbFt1oQ573iglWIPj9ieNcA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=iki.fi;
	s=lahtoruutu; t=1668420403;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=n0E8YgTPeMlZaTVJH+p1nlFsfAcKuXhV2rFQ22qn48c=;
	b=Y7aT1VsbOGmSSq0I11cX04+ntBpkgrH+238otZdCyVwtdq0kmDNgAwbqnw2uJHmAwlXOhp
	4OWi9/qmTpRIH9nEODPdN+JHljny2C2A/oLd67LairhSX9OLgw151jmgyRpv/YWYwTJNqr
	xw0N7qRGnsAlfCk1sGcZdxETsGw4neW9z3V3rH3s9PwiEw5Tbvebsx+vDcpUVOWeAxju+n
	UJn5YyibKo7fJjWDj6p1ybGaWQgn8WngXgLkKhE8gEULUzMJjY+0B5Kr1g8lWCoD8aiglc
	XaMpEbYeBnjnKxFGjVhMXU8dY4wM5ye7w2Zr5gLLSlctguS2A+zZDtLfAs2VcA==
ARC-Authentication-Results: i=1;
	ORIGINATING;
	auth=pass smtp.auth=sailus smtp.mailfrom=sakari.ailus@iki.fi
ARC-Seal: i=1; s=lahtoruutu; d=iki.fi; t=1668420403; a=rsa-sha256;
	cv=none;
	b=IMUzKT1HHR3XdI0gIP1tP9McRHkNwkZxTDbqyBNTHnGJoEl7a09jiaSwNs1dIwaGQ4J4z7
	meXNjGkXeywM6mYFzXmtOF4EU05jXt+t0AG/kqMRuQ/RUQxEKqNIzPZQgTGZ1uZdXlxM0a
	2CC+UWWvxv3yIKTGWfBH2xsghWpY83FY6YmXRxerN4JD0LbqHyXH/tkjm/3+oD6HcoBSWu
	3EtJkg0KUty7702ZQvNseszepNz1SXgn5UZhyTjY7XmDpJe31YYSNDCqvquD4t++pHY4N8
	lMWHl24CWAcoKOYPnpdXUPEo0GOaS7qbj8wolwFQ78JqD0Aw0v8Z/sW7TO6sAQ==
Received: from valkosipuli.retiisi.eu (valkosipuli.localdomain [192.168.4.2])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by hillosipuli.retiisi.eu (Postfix) with ESMTPS id 7D31F634C97;
	Mon, 14 Nov 2022 12:06:42 +0200 (EET)
Date: Mon, 14 Nov 2022 12:06:42 +0200
From: Sakari Ailus <sakari.ailus@iki.fi>
To: Paul Kocialkowski <paul.kocialkowski@bootlin.com>
Cc: linux-kernel@vger.kernel.org, linux-media@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev,
	Yong Deng <yong.deng@magewell.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Chen-Yu Tsai <wens@csie.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Samuel Holland <samuel@sholland.org>,
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
	Maxime Ripard <maxime@cerno.tech>
Subject: Re: [PATCH v7 02/28] media: sun6i-csi: Rename sun6i_video to
 sun6i_csi_capture
Message-ID: <Y3ITMguJsMQH96dt@valkosipuli.retiisi.eu>
References: <20221103163113.245462-1-paul.kocialkowski@bootlin.com>
 <20221103163113.245462-3-paul.kocialkowski@bootlin.com>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20221103163113.245462-3-paul.kocialkowski@bootlin.com>

Hi Paul,

On Thu, Nov 03, 2022 at 05:30:47PM +0100, Paul Kocialkowski wrote:
> diff --git a/drivers/media/platform/sunxi/sun6i-csi/sun6i_video.c b/drivers/media/platform/sunxi/sun6i-csi/sun6i_csi_capture.c
> similarity index 58%
> rename from drivers/media/platform/sunxi/sun6i-csi/sun6i_video.c
> rename to drivers/media/platform/sunxi/sun6i-csi/sun6i_csi_capture.c
> index fa83211a2c5a..9838a5a43c2d 100644
> --- a/drivers/media/platform/sunxi/sun6i-csi/sun6i_video.c
> +++ b/drivers/media/platform/sunxi/sun6i-csi/sun6i_csi_capture.c
> @@ -15,7 +15,7 @@
>  #include <media/videobuf2-v4l2.h>
>  
>  #include "sun6i_csi.h"
> -#include "sun6i_video.h"
> +#include "sun6i_csi_capture.h"
>  
>  /* This is got from BSP sources. */
>  #define MIN_WIDTH	(32)
> @@ -26,7 +26,7 @@
>  /* Helpers */
>  
>  static struct v4l2_subdev *
> -sun6i_video_remote_subdev(struct sun6i_video *video, u32 *pad)
> +sun6i_csi_capture_remote_subdev(struct sun6i_csi_capture *capture, u32 *pad)
>  {
>  	struct media_pad *remote;
>  

"video" was still being used a few lines below this, fixed that while
applying. The PR has been sent already. Just FYI.

-- 
Kind regards,

Sakari Ailus
