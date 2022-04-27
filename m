Received: from mail-ed1-f43.google.com (mail-ed1-f43.google.com [209.85.208.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6925033E5
	for <linux-sunxi@lists.linux.dev>; Wed, 27 Apr 2022 19:50:57 +0000 (UTC)
Received: by mail-ed1-f43.google.com with SMTP id b24so3139596edu.10
        for <linux-sunxi@lists.linux.dev>; Wed, 27 Apr 2022 12:50:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=33j4YNSNaU5u59fgSber6SgSZ1FYBjfWnCsj8i53xiY=;
        b=paqZNLRh816sci8wvt4ZMNGemC8tLQEZQbrY9GK0GF+9tda40M4Hbqk6a0iBrMeUWR
         pFZw8B9zMxIKU4oUgr8+nrR6asJ3HHqlfrm/haG45dyuWn4dCJtZo9iXZTnfySlgXT3t
         hfWQrG+tpXivhbySzfp7k6Rk5PR2rVcj6riFEWVUFsFoTt/5h7OvNo2+YpjEVTZ2xbUC
         c10ykpZtbfcdncFg30IrZLX8FfLSEHT6hnStz8jts0Luz3Lxkcny6oyP0KExznklnIZU
         VYhJCy5QIq7gG+pKuyC/cj25vXJGb4q9Sa9LyBnXyRWxTevQJuTPOWyWGT0vXxA0M61N
         uP7w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=33j4YNSNaU5u59fgSber6SgSZ1FYBjfWnCsj8i53xiY=;
        b=w8I9e8SRdagYT7CX4VDoklqE9hnJmagu8jnwFt32v/g0Vr0+ET39dsfTpeoiJrbEmT
         yLMHX8Fa2o9mD79LWTX/z9OYE6d9mKwb12chUBneqPrvylpCFlzVILuRADF5W6ke9ltx
         YiGBfpH3F+z3xgInb8bwC6/og3gRkuWQCQmb3SvJziXT+05bfWU43thCNQIs2RpzyZBW
         3s+Gs5wHJfpwGjMLJc7aCVuQc3LlJ9B2hnAlN4vyTWgFhWMnm4/q+ew1uuQnaTWHUk5b
         ArAbS6OhMf+tp24ev439hTz4UdHAizhYwqnux7/krfxMPxvzWnokRIwrbziO+jnRvpcN
         tzAQ==
X-Gm-Message-State: AOAM532pe9/jeaAIwdhT1zlDZaKYiVNehzutDZlNKjkOF4MD4gYmY6KX
	h1CIZT6GtFpQXD7Luwx7W5c=
X-Google-Smtp-Source: ABdhPJw1YgYtwx9aqlQwyWIGlVQaBzLeEYF1CEFQZPIzcHlqxRakh1b8DdGiXc19hCSJewwbYeHPOA==
X-Received: by 2002:a05:6402:5286:b0:425:f0fb:5d23 with SMTP id en6-20020a056402528600b00425f0fb5d23mr15599225edb.243.1651089055670;
        Wed, 27 Apr 2022 12:50:55 -0700 (PDT)
Received: from jernej-laptop.localnet (89-212-118-115.static.t-2.net. [89.212.118.115])
        by smtp.gmail.com with ESMTPSA id j12-20020aa7de8c000000b0042617ba63b2sm104085edv.60.2022.04.27.12.50.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 27 Apr 2022 12:50:55 -0700 (PDT)
From: Jernej =?utf-8?B?xaBrcmFiZWM=?= <jernej.skrabec@gmail.com>
To: linux-kernel@vger.kernel.org, linux-media@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev, Paul Kocialkowski <paul.kocialkowski@bootlin.com>
Cc: Yong Deng <yong.deng@magewell.com>, Paul Kocialkowski <paul.kocialkowski@bootlin.com>, Mauro Carvalho Chehab <mchehab@kernel.org>, Chen-Yu Tsai <wens@csie.org>, Samuel Holland <samuel@sholland.org>, Laurent Pinchart <laurent.pinchart@ideasonboard.com>, Maxime Ripard <mripard@kernel.org>, Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Subject: Re: [PATCH v4 37/45] media: sun6i-csi: Rename the capture video device to sun6i-csi-capture
Date: Wed, 27 Apr 2022 21:50:54 +0200
Message-ID: <14612220.tv2OnDr8pf@jernej-laptop>
In-Reply-To: <20220415152811.636419-38-paul.kocialkowski@bootlin.com>
References: <20220415152811.636419-1-paul.kocialkowski@bootlin.com> <20220415152811.636419-38-paul.kocialkowski@bootlin.com>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"

Dne petek, 15. april 2022 ob 17:28:03 CEST je Paul Kocialkowski napisal(a):
> Now that the driver is properly split between bridge and capture,
> rename the video device to highlight its role and be in line with
> the bridge entity naming.
> 
> Signed-off-by: Paul Kocialkowski <paul.kocialkowski@bootlin.com>

Acked-by: Jernej Skrabec <jernej.skrabec@gmail.com>

Best regards,
Jernej

> ---
>  drivers/media/platform/sunxi/sun6i-csi/sun6i_csi_capture.c | 3 ++-
>  drivers/media/platform/sunxi/sun6i-csi/sun6i_csi_capture.h | 2 ++
>  2 files changed, 4 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/media/platform/sunxi/sun6i-csi/sun6i_csi_capture.c
> b/drivers/media/platform/sunxi/sun6i-csi/sun6i_csi_capture.c index
> a6619d083308..c3b1e1411da4 100644
> --- a/drivers/media/platform/sunxi/sun6i-csi/sun6i_csi_capture.c
> +++ b/drivers/media/platform/sunxi/sun6i-csi/sun6i_csi_capture.c
> @@ -1027,7 +1027,8 @@ int sun6i_csi_capture_setup(struct sun6i_csi_device
> *csi_dev)
> 
>  	/* Video Device */
> 
> -	strscpy(video_dev->name, SUN6I_CSI_NAME, sizeof(video_dev->name));
> +	strscpy(video_dev->name, SUN6I_CSI_CAPTURE_NAME,
> +		sizeof(video_dev->name));
>  	video_dev->device_caps = V4L2_CAP_VIDEO_CAPTURE | 
V4L2_CAP_STREAMING;
>  	video_dev->vfl_dir = VFL_DIR_RX;
>  	video_dev->release = video_device_release_empty;
> diff --git a/drivers/media/platform/sunxi/sun6i-csi/sun6i_csi_capture.h
> b/drivers/media/platform/sunxi/sun6i-csi/sun6i_csi_capture.h index
> a61db3bc72e5..59c57bcefeec 100644
> --- a/drivers/media/platform/sunxi/sun6i-csi/sun6i_csi_capture.h
> +++ b/drivers/media/platform/sunxi/sun6i-csi/sun6i_csi_capture.h
> @@ -11,6 +11,8 @@
>  #include <media/v4l2-dev.h>
>  #include <media/videobuf2-core.h>
> 
> +#define SUN6I_CSI_CAPTURE_NAME	"sun6i-csi-capture"
> +
>  #define SUN6I_CSI_CAPTURE_WIDTH_MIN	32
>  #define SUN6I_CSI_CAPTURE_WIDTH_MAX	4800
>  #define SUN6I_CSI_CAPTURE_HEIGHT_MIN	32




