Received: from mail-ed1-f43.google.com (mail-ed1-f43.google.com [209.85.208.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5CB778480
	for <linux-sunxi@lists.linux.dev>; Fri,  4 Nov 2022 17:36:31 +0000 (UTC)
Received: by mail-ed1-f43.google.com with SMTP id x2so8679242edd.2
        for <linux-sunxi@lists.linux.dev>; Fri, 04 Nov 2022 10:36:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=AN/gGtQTeZ/7kTZo5cIa72NMTTjOeEbVteteRCoz+cM=;
        b=V1Pzi0jU2ax4MAjMptvIHNXO3GQ95l9hxpQH44/NEszUE8GLXB5GTO0BLBlD7bzFY7
         BetGKzvUarvxGW+t5Xm5YeKSZ1on4z2JOJFGMnGwUFvWaI4taTuHRLq0EVr2AkzXgrTh
         JVB3lTA/54A0hpxKXkKARqHJbw8GAyIR7SJjdJnd5QLZJ57yWe2KONsFqOUVJsGBnoLM
         mk2aGOBdeCyzPVsFOFK7iy1eYGrrtoBeFZft4RWTox7XQrkB/ba0ILbNvQOmEiT2k/sF
         I/SOrPpDasue0LgFQHqBVFpEWXcSNNM4U+Ipk2t0wUc7f91egqb7I+8iu0UsTHZhalmm
         uKQQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=AN/gGtQTeZ/7kTZo5cIa72NMTTjOeEbVteteRCoz+cM=;
        b=nF/PiRw23zn66NEYOWMNDpGppeKn1kqdRI/QYHD21+kvMqxiURwOFcKPYFjc0DyxlX
         JIgOmT2JokVXtJ3Ve8GcNnWEcvvOJKUMtC5UuegsMrSADelXZksGXieWkXkMapTChObZ
         wkxjHF5axFlIxb8ivTXumBfGWya27ZSXuVDevR8cNFm2aM0TprJWIrcvWxC8/XdpRWcZ
         iofUgLhUC+wrC+udgjmH8tACU2CrUEqYfiMgCTnlyp/rq7t/vSl2DPqZg42VpuyifPuW
         xtZV9hvZ3s5Vsj5SPCjBp308kNWqaH2E5zA/Xw17hqiChTCwWkhvnYBKf50dJ1gmlQVX
         lfkQ==
X-Gm-Message-State: ACrzQf2xCkeTetEnowcefq1jPlL9UpXV8Plt+Jwkt/Ueo3XXnx31QtLR
	wEhzpTfPajAgfQB0FOtJI8A=
X-Google-Smtp-Source: AMsMyM65eK7YFk6AdQ5ckrN8NvW+dW110QgbSJmLUh82AZb1p4psMsdQ3DsJxeISZBGVruAXetIM8g==
X-Received: by 2002:aa7:d3d3:0:b0:462:7435:8b14 with SMTP id o19-20020aa7d3d3000000b0046274358b14mr36125236edr.370.1667583389564;
        Fri, 04 Nov 2022 10:36:29 -0700 (PDT)
Received: from jernej-laptop.localnet (89-212-118-115.static.t-2.net. [89.212.118.115])
        by smtp.gmail.com with ESMTPSA id b7-20020a17090636c700b0078de26f66b9sm2058922ejc.114.2022.11.04.10.36.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 04 Nov 2022 10:36:29 -0700 (PDT)
From: Jernej =?utf-8?B?xaBrcmFiZWM=?= <jernej.skrabec@gmail.com>
To: mchehab@kernel.org, Hans Verkuil <hverkuil-cisco@xs4all.nl>
Cc: robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org, wens@csie.org, samuel@sholland.org, linux-media@vger.kernel.org, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 0/3] media: sunxi: Add H6 deinterlace driver
Date: Fri, 04 Nov 2022 18:36:27 +0100
Message-ID: <2652146.mvXUDI8C0e@jernej-laptop>
In-Reply-To: <71e8ea95-8c3a-cc85-1638-5ce421a60e99@xs4all.nl>
References: <20221101123201.3021129-1-jernej.skrabec@gmail.com> <71e8ea95-8c3a-cc85-1638-5ce421a60e99@xs4all.nl>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"

Hi Hans,

Dne petek, 04. november 2022 ob 12:33:50 CET je Hans Verkuil napisal(a):
> Hi Jernej,
> 
> Can you add a patch updating the MAINTAINERS file? Just post a 4/3 patch :-)

It's already part of patch 2. I didn't see the reason to split it to separate 
patch.

Best regards,
Jernej

> 
> Regards,
> 
> 	Hans
> 
> On 01/11/2022 13:31, Jernej Skrabec wrote:
> > This series implements driver for H6 deinterlace core, which is
> > newer version of core, covered by sun8i-di (v2.3). Contrary to
> > older one, it doesn't support scaling, but it supports iommu,
> > has additional motion compensated deinterlacing algorithm and
> > supports different pixel formats.
> > 
> > v4l2-compliance 1.23.0-4961, 64 bits, 64-bit time_t
> > v4l2-compliance SHA: f86484524f32 2022-10-21 10:08:58
> > 
> > Compliance test for sun50i-di device /dev/video0:
> > 
> > Driver Info:
> >         Driver name      : sun50i-di
> >         Card type        : sun50i-di
> >         Bus info         : platform:sun50i-di
> >         Driver version   : 6.1.0
> >         Capabilities     : 0x84208000
> >         
> >                 Video Memory-to-Memory
> >                 Streaming
> >                 Extended Pix Format
> >                 Device Capabilities
> >         
> >         Device Caps      : 0x04208000
> >         
> >                 Video Memory-to-Memory
> >                 Streaming
> >                 Extended Pix Format
> > 
> > Required ioctls:
> >         test VIDIOC_QUERYCAP: OK
> >         test invalid ioctls: OK
> > 
> > Allow for multiple opens:
> >         test second /dev/video0 open: OK
> >         test VIDIOC_QUERYCAP: OK
> >         test VIDIOC_G/S_PRIORITY: OK
> >         test for unlimited opens: OK
> > 
> > Debug ioctls:
> >         test VIDIOC_DBG_G/S_REGISTER: OK (Not Supported)
> >         test VIDIOC_LOG_STATUS: OK (Not Supported)
> > 
> > Input ioctls:
> >         test VIDIOC_G/S_TUNER/ENUM_FREQ_BANDS: OK (Not Supported)
> >         test VIDIOC_G/S_FREQUENCY: OK (Not Supported)
> >         test VIDIOC_S_HW_FREQ_SEEK: OK (Not Supported)
> >         test VIDIOC_ENUMAUDIO: OK (Not Supported)
> >         test VIDIOC_G/S/ENUMINPUT: OK (Not Supported)
> >         test VIDIOC_G/S_AUDIO: OK (Not Supported)
> >         Inputs: 0 Audio Inputs: 0 Tuners: 0
> > 
> > Output ioctls:
> >         test VIDIOC_G/S_MODULATOR: OK (Not Supported)
> >         test VIDIOC_G/S_FREQUENCY: OK (Not Supported)
> >         test VIDIOC_ENUMAUDOUT: OK (Not Supported)
> >         test VIDIOC_G/S/ENUMOUTPUT: OK (Not Supported)
> >         test VIDIOC_G/S_AUDOUT: OK (Not Supported)
> >         Outputs: 0 Audio Outputs: 0 Modulators: 0
> > 
> > Input/Output configuration ioctls:
> >         test VIDIOC_ENUM/G/S/QUERY_STD: OK (Not Supported)
> >         test VIDIOC_ENUM/G/S/QUERY_DV_TIMINGS: OK (Not Supported)
> >         test VIDIOC_DV_TIMINGS_CAP: OK (Not Supported)
> >         test VIDIOC_G/S_EDID: OK (Not Supported)
> > 
> > Control ioctls:
> >         test VIDIOC_QUERY_EXT_CTRL/QUERYMENU: OK (Not Supported)
> >         test VIDIOC_QUERYCTRL: OK (Not Supported)
> >         test VIDIOC_G/S_CTRL: OK (Not Supported)
> >         test VIDIOC_G/S/TRY_EXT_CTRLS: OK (Not Supported)
> >         test VIDIOC_(UN)SUBSCRIBE_EVENT/DQEVENT: OK (Not Supported)
> >         test VIDIOC_G/S_JPEGCOMP: OK (Not Supported)
> >         Standard Controls: 0 Private Controls: 0
> > 
> > Format ioctls:
> >         test VIDIOC_ENUM_FMT/FRAMESIZES/FRAMEINTERVALS: OK
> >         test VIDIOC_G/S_PARM: OK (Not Supported)
> >         test VIDIOC_G_FBUF: OK (Not Supported)
> >         test VIDIOC_G_FMT: OK
> >         test VIDIOC_TRY_FMT: OK
> >         test VIDIOC_S_FMT: OK
> >         test VIDIOC_G_SLICED_VBI_CAP: OK (Not Supported)
> >         test Cropping: OK (Not Supported)
> >         test Composing: OK (Not Supported)
> >         test Scaling: OK (Not Supported)
> > 
> > Codec ioctls:
> >         test VIDIOC_(TRY_)ENCODER_CMD: OK (Not Supported)
> >         test VIDIOC_G_ENC_INDEX: OK (Not Supported)
> >         test VIDIOC_(TRY_)DECODER_CMD: OK (Not Supported)
> > 
> > Buffer ioctls:
> >         test VIDIOC_REQBUFS/CREATE_BUFS/QUERYBUF: OK
> >         test VIDIOC_EXPBUF: OK
> >         test Requests: OK (Not Supported)
> > 
> > Total for sun50i-di device /dev/video0: 45, Succeeded: 45, Failed: 0,
> > Warnings: 0
> > 
> > Best regards,
> > Jernej
> > 
> > Jernej Skrabec (3):
> >   media: dt-bindings: media: Add Allwinner H6 Deinterlace binding
> >   media: sunxi: Add H6 deinterlace driver
> >   arm64: dts: allwinner: h6: Add deinterlace node
> >  
> >  .../allwinner,sun50i-h6-deinterlace.yaml      |   74 ++
> >  MAINTAINERS                                   |    4 +-
> >  arch/arm64/boot/dts/allwinner/sun50i-h6.dtsi  |   12 +
> >  drivers/media/platform/sunxi/Kconfig          |    1 +
> >  drivers/media/platform/sunxi/Makefile         |    1 +
> >  .../media/platform/sunxi/sun50i-di/Kconfig    |   15 +
> >  .../media/platform/sunxi/sun50i-di/Makefile   |    2 +
> >  .../platform/sunxi/sun50i-di/sun50i-di.c      | 1142 +++++++++++++++++
> >  .../platform/sunxi/sun50i-di/sun50i-di.h      |  175 +++
> >  9 files changed, 1425 insertions(+), 1 deletion(-)
> >  create mode 100644
> >  Documentation/devicetree/bindings/media/allwinner,sun50i-h6-deinterlace.
> >  yaml create mode 100644 drivers/media/platform/sunxi/sun50i-di/Kconfig
> >  create mode 100644 drivers/media/platform/sunxi/sun50i-di/Makefile
> >  create mode 100644 drivers/media/platform/sunxi/sun50i-di/sun50i-di.c
> >  create mode 100644 drivers/media/platform/sunxi/sun50i-di/sun50i-di.h
> > 
> > --
> > 2.38.1




