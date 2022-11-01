Received: from mail-wr1-f47.google.com (mail-wr1-f47.google.com [209.85.221.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1A2317C
	for <linux-sunxi@lists.linux.dev>; Tue,  1 Nov 2022 12:32:20 +0000 (UTC)
Received: by mail-wr1-f47.google.com with SMTP id y16so19869370wrt.12
        for <linux-sunxi@lists.linux.dev>; Tue, 01 Nov 2022 05:32:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=asoWekP0S6I4rKhiYwy8FgHvcv/s8ZlTBqdD48kgwrs=;
        b=SV/rrSTjwUPVGv5ixCHdcN+wfHbDMCSfpgFpNcYO6UyADssLZD1Ro4bQWQwaE6iSFF
         6pxN5PxMmGGuUDbQV1lkcT+bsDnQX8LI+YSbbrAuehqYvlzy4dfCxQJj8L3ZRsqBeqrn
         eMNUNoaB16qd+hLTF/yRzieHKp6Zfe2MkfJJoLk91V1vnCzsj+DtdGsGGfBEXOMYkycH
         BPK8J+X4ZgFkkS+MM8PP1UKzBKJcvGGdcT7sYdM1mRjTFE4zuSswJQXqiKCxV6I1uYhS
         EpxltdmTLZtbO6Je/PIR9/TLFUPH6fFkvW8LIUgoz625eJdgdUeD2APgdv+3HPhPrs1G
         nm1Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=asoWekP0S6I4rKhiYwy8FgHvcv/s8ZlTBqdD48kgwrs=;
        b=GkmZmbIFc22Mq370SgyfXptz1o1ZPeTrEZ8rxrAMlKp/pgZFHKX3j9nJbWNWJ0ObKV
         ylCVj8yBKlSrRYarXbw4KJoBzNn+FukaPR9Kiv0Q9ahohK9/hlCywd/LbgKOZKiIrdoS
         Rau8ubl/EJ+cRSRwKzSGqS5IhMdKO3m5om71H10vMIhd29QfsHvso9JOvVMm0LHv5Oi7
         Mq68nHmslBNvMjusp3JD6pB698Cgewx96P0Bc7bbZEL4Bifj6FuwT7LDdCfhy+DUHSlc
         MEYj4tVRwx1itmr63tGGvQZRsVnxqfM7hTUincDoPsZqF2Zeov/TC7fxvnAHV57wEeMl
         2gcw==
X-Gm-Message-State: ACrzQf3VQdfa3mZd8W6tYu9SPr2bkJh4ZaM+DlmP9Vqtxsg9ztLQ4x17
	iiHvwn2NlWH1mVFpQ8Q0tp0=
X-Google-Smtp-Source: AMsMyM7yIX+qGuPW1i/7qFvjN9goSNuVqX60VD/ARdYElANN5QYXIPnACp6wyWxRCeRKJIQuEwpSug==
X-Received: by 2002:a05:6000:1887:b0:236:7b1a:b14c with SMTP id a7-20020a056000188700b002367b1ab14cmr11561165wri.173.1667305939174;
        Tue, 01 Nov 2022 05:32:19 -0700 (PDT)
Received: from kista.localdomain (82-149-19-102.dynamic.telemach.net. [82.149.19.102])
        by smtp.gmail.com with ESMTPSA id f18-20020a1cc912000000b003cf5ec79bf9sm10404176wmb.40.2022.11.01.05.32.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 01 Nov 2022 05:32:18 -0700 (PDT)
From: Jernej Skrabec <jernej.skrabec@gmail.com>
To: mchehab@kernel.org,
	hverkuil-cisco@xs4all.nl
Cc: robh+dt@kernel.org,
	krzysztof.kozlowski+dt@linaro.org,
	wens@csie.org,
	samuel@sholland.org,
	linux-media@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-sunxi@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Jernej Skrabec <jernej.skrabec@gmail.com>
Subject: [PATCH 0/3] media: sunxi: Add H6 deinterlace driver
Date: Tue,  1 Nov 2022 13:31:58 +0100
Message-Id: <20221101123201.3021129-1-jernej.skrabec@gmail.com>
X-Mailer: git-send-email 2.38.1
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This series implements driver for H6 deinterlace core, which is
newer version of core, covered by sun8i-di (v2.3). Contrary to
older one, it doesn't support scaling, but it supports iommu,
has additional motion compensated deinterlacing algorithm and
supports different pixel formats.

v4l2-compliance 1.23.0-4961, 64 bits, 64-bit time_t
v4l2-compliance SHA: f86484524f32 2022-10-21 10:08:58

Compliance test for sun50i-di device /dev/video0:

Driver Info:
        Driver name      : sun50i-di
        Card type        : sun50i-di
        Bus info         : platform:sun50i-di
        Driver version   : 6.1.0
        Capabilities     : 0x84208000
                Video Memory-to-Memory
                Streaming
                Extended Pix Format
                Device Capabilities
        Device Caps      : 0x04208000
                Video Memory-to-Memory
                Streaming
                Extended Pix Format

Required ioctls:
        test VIDIOC_QUERYCAP: OK
        test invalid ioctls: OK

Allow for multiple opens:
        test second /dev/video0 open: OK
        test VIDIOC_QUERYCAP: OK
        test VIDIOC_G/S_PRIORITY: OK
        test for unlimited opens: OK

Debug ioctls:
        test VIDIOC_DBG_G/S_REGISTER: OK (Not Supported)
        test VIDIOC_LOG_STATUS: OK (Not Supported)

Input ioctls:
        test VIDIOC_G/S_TUNER/ENUM_FREQ_BANDS: OK (Not Supported)
        test VIDIOC_G/S_FREQUENCY: OK (Not Supported)
        test VIDIOC_S_HW_FREQ_SEEK: OK (Not Supported)
        test VIDIOC_ENUMAUDIO: OK (Not Supported)
        test VIDIOC_G/S/ENUMINPUT: OK (Not Supported)
        test VIDIOC_G/S_AUDIO: OK (Not Supported)
        Inputs: 0 Audio Inputs: 0 Tuners: 0

Output ioctls:
        test VIDIOC_G/S_MODULATOR: OK (Not Supported)
        test VIDIOC_G/S_FREQUENCY: OK (Not Supported)
        test VIDIOC_ENUMAUDOUT: OK (Not Supported)
        test VIDIOC_G/S/ENUMOUTPUT: OK (Not Supported)
        test VIDIOC_G/S_AUDOUT: OK (Not Supported)
        Outputs: 0 Audio Outputs: 0 Modulators: 0

Input/Output configuration ioctls:
        test VIDIOC_ENUM/G/S/QUERY_STD: OK (Not Supported)
        test VIDIOC_ENUM/G/S/QUERY_DV_TIMINGS: OK (Not Supported)
        test VIDIOC_DV_TIMINGS_CAP: OK (Not Supported)
        test VIDIOC_G/S_EDID: OK (Not Supported)

Control ioctls:
        test VIDIOC_QUERY_EXT_CTRL/QUERYMENU: OK (Not Supported)
        test VIDIOC_QUERYCTRL: OK (Not Supported)
        test VIDIOC_G/S_CTRL: OK (Not Supported)
        test VIDIOC_G/S/TRY_EXT_CTRLS: OK (Not Supported)
        test VIDIOC_(UN)SUBSCRIBE_EVENT/DQEVENT: OK (Not Supported)
        test VIDIOC_G/S_JPEGCOMP: OK (Not Supported)
        Standard Controls: 0 Private Controls: 0

Format ioctls:
        test VIDIOC_ENUM_FMT/FRAMESIZES/FRAMEINTERVALS: OK
        test VIDIOC_G/S_PARM: OK (Not Supported)
        test VIDIOC_G_FBUF: OK (Not Supported)
        test VIDIOC_G_FMT: OK
        test VIDIOC_TRY_FMT: OK
        test VIDIOC_S_FMT: OK
        test VIDIOC_G_SLICED_VBI_CAP: OK (Not Supported)
        test Cropping: OK (Not Supported)
        test Composing: OK (Not Supported)
        test Scaling: OK (Not Supported)

Codec ioctls:
        test VIDIOC_(TRY_)ENCODER_CMD: OK (Not Supported)
        test VIDIOC_G_ENC_INDEX: OK (Not Supported)
        test VIDIOC_(TRY_)DECODER_CMD: OK (Not Supported)

Buffer ioctls:
        test VIDIOC_REQBUFS/CREATE_BUFS/QUERYBUF: OK
        test VIDIOC_EXPBUF: OK
        test Requests: OK (Not Supported)

Total for sun50i-di device /dev/video0: 45, Succeeded: 45, Failed: 0, Warnings: 0

Best regards,
Jernej

Jernej Skrabec (3):
  media: dt-bindings: media: Add Allwinner H6 Deinterlace binding
  media: sunxi: Add H6 deinterlace driver
  arm64: dts: allwinner: h6: Add deinterlace node

 .../allwinner,sun50i-h6-deinterlace.yaml      |   74 ++
 MAINTAINERS                                   |    4 +-
 arch/arm64/boot/dts/allwinner/sun50i-h6.dtsi  |   12 +
 drivers/media/platform/sunxi/Kconfig          |    1 +
 drivers/media/platform/sunxi/Makefile         |    1 +
 .../media/platform/sunxi/sun50i-di/Kconfig    |   15 +
 .../media/platform/sunxi/sun50i-di/Makefile   |    2 +
 .../platform/sunxi/sun50i-di/sun50i-di.c      | 1142 +++++++++++++++++
 .../platform/sunxi/sun50i-di/sun50i-di.h      |  175 +++
 9 files changed, 1425 insertions(+), 1 deletion(-)
 create mode 100644 Documentation/devicetree/bindings/media/allwinner,sun50i-h6-deinterlace.yaml
 create mode 100644 drivers/media/platform/sunxi/sun50i-di/Kconfig
 create mode 100644 drivers/media/platform/sunxi/sun50i-di/Makefile
 create mode 100644 drivers/media/platform/sunxi/sun50i-di/sun50i-di.c
 create mode 100644 drivers/media/platform/sunxi/sun50i-di/sun50i-di.h

--
2.38.1

