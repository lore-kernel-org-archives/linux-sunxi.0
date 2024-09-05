Received: from mail-oa1-f52.google.com (mail-oa1-f52.google.com [209.85.160.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AA93B2F44
	for <linux-sunxi@lists.linux.dev>; Thu,  5 Sep 2024 04:17:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725509865; cv=none; b=LL2wDlFNImITd1UvsfjGD/gSXCOe/6QuBxmcivRErRkcWH77Q8C8HcM1zUxeSqX2VdbNMS5VM08nynXsHAcMZgsBDtYEP9uqLY2NWip2B/JFIis17SdE37LdHUklohlDU/Q1Pn0O4/GEcU3zz1uIcb107M1NY0ta4GbjtCshYgI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725509865; c=relaxed/simple;
	bh=8cHGr+GH14IwDdxFnQ/5Ipz4yJW72zoitNYtP9WhIjQ=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=YCc8Aq/EUUoJCEH04rXupwPc4ZaMbc3Wf555Ao/3PQcbDiMFiu1G5+HQpI9vJe3kelMq7LVBPc4VXR8t+OySSVt7GDfGu2j8GZnMPejqfemqNyaQ0iuODcVyCiTLwYNSJFx0MQQsBx3e299fUHq2jf/+3Pby+k14VRVv76uozt0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=l6p2zsus; arc=none smtp.client-ip=209.85.160.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="l6p2zsus"
Received: by mail-oa1-f52.google.com with SMTP id 586e51a60fabf-27051f63018so202393fac.3
        for <linux-sunxi@lists.linux.dev>; Wed, 04 Sep 2024 21:17:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1725509863; x=1726114663; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=K4M9q+kN73VYSDW6L8zxKtLlMvaCoXBGrFd+VEAeAfA=;
        b=l6p2zsusqqetPjUf+mmOUFivd8VN60cwvAn61kvIRaTzAAERIJIG7lKgfDKGePs/O1
         MhS2pp9lh0aYEW40xvGEmcHpUgVdOyo94EVov6p2Rf+IpP57TVllYcxetS2ezglA1Z/L
         F6FbjNsoJU9aC2/bVguLAgOU8OMi876dn4dfVhP0YVqtfib41NHmiq6wQCaQuLV5QrVY
         hQe8OEp0gokvAi9hnlYKnAW8Le6j+3FA4jtztfo8L7Kwh2U+KbP/J66c0IbZM9lr9pVA
         f6dA10QsV3qDqIJM0k6Y53h70i/mQyA25lfRG7XfWf665E1faHwVaXMfHWYjpLSVpBCL
         6i8w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1725509863; x=1726114663;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=K4M9q+kN73VYSDW6L8zxKtLlMvaCoXBGrFd+VEAeAfA=;
        b=L0/CiGFJPwR/ZiSl0VliF9YV/fJslczNYz10qJEdno49vqhlbEUeIw6Zg7jTEDfYSM
         4b1+lTBygSR/qyn8kGLm4blvn03XllzIH1yp5VfeBNFbiaNRVRlCvBocXDcggo883J9F
         YUN8ApsY9I4BrFEbaLSEgu3wsfbXa9PAEbw3JsEvuVVczZY/4ZZYNAW4/djqTnkh8jfL
         +QFTc7iCXFDuow+LfENYWgqlljcI5jei1Od+lOiTYPC5GFxhohMW6jlEFUym3NZVyRDH
         TXyF1xWiKbqNwigZHjh+lCiS8qLq+0K1deb4uf4XFdW0mpDJW1yTOz+y+yXh6JxBTejx
         7jCw==
X-Forwarded-Encrypted: i=1; AJvYcCVBb01jmhfzeqLlUg8cZzTSDQvmi6CTN9pUtOkUP5EGdq+X+SBTBbS1Ng/+KuFR/Vr2oBrCF3AgQGvlBw==@lists.linux.dev
X-Gm-Message-State: AOJu0Yy6fSNqgMBT7fimSHgE3C3FHII4gcLTmnNfRpGfjQvbRSE7SRBg
	5lVmfSU0lNBhcSMMPcZBbwB4DeIijtM1xR+X6SWr/7RrBgE+dRoV
X-Google-Smtp-Source: AGHT+IE346rXlPlagQTZcOHpZl4+DAe05+tRp5bqoGWXkgCQc9psXkFiWkYrSTnLTh/SBEscY60t2g==
X-Received: by 2002:a05:6871:3a28:b0:251:2755:5a33 with SMTP id 586e51a60fabf-277d05f9b26mr18381175fac.39.1725509862578;
        Wed, 04 Sep 2024 21:17:42 -0700 (PDT)
Received: from dtor-ws.sjc.corp.google.com ([2620:15c:9d:2:13bd:b4e:4c0f:4c37])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-7d4fbd8d52esm2450216a12.32.2024.09.04.21.17.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Sep 2024 21:17:42 -0700 (PDT)
From: Dmitry Torokhov <dmitry.torokhov@gmail.com>
To: linux-input@vger.kernel.org
Cc: =?UTF-8?q?Pali=20Roh=C3=A1r?= <pali@kernel.org>,
	Helge Deller <deller@gmx.de>,
	"K. Y. Srinivasan" <kys@microsoft.com>,
	Wei Liu <wei.liu@kernel.org>,
	Dexuan Cui <decui@microsoft.com>,
	Samuel Holland <samuel@sholland.org>,
	Lyude Paul <thatslyude@gmail.com>,
	Michal Simek <michal.simek@amd.com>,
	Hans de Goede <hdegoede@redhat.com>,
	linux-kernel@vger.kernel.org,
	linux-hyperv@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-sunxi@lists.linux.dev
Subject: [PATCH 00/24] Convert serio-related drivers to use new cleanup facilities
Date: Wed,  4 Sep 2024 21:17:05 -0700
Message-ID: <20240905041732.2034348-1-dmitry.torokhov@gmail.com>
X-Mailer: git-send-email 2.46.0.469.g59c65b2a67-goog
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Hi,

This series converts drivers found in drivers/input/serio as well as a
few of input drivers using serio to use new __free() and guard() cleanup
facilities that simplify the code and ensure that all resources are
released appropriately.

First patch introduces serio_pause_rx guard that pauses delivery of
interrupts/data for a given serio port by calling serio_pause_rx()
helper and automatically resumes it by calling serio_resume_rx() when
needed.

The following 8 patches make use if this new guard.

The rest of the patches switch serio drivers to use guard(mutex),
guard(spinlock*) and other cleanup functions to simplify the code.

Thanks!

Dmitry Torokhov (24):
  Input: serio - define serio_pause_rx guard to pause and resume serio ports
  Input: libps2 - use guard notation when temporarily pausing serio ports
  Input: alps - use guard notation when pausing serio port
  Input: byd - use guard notation when pausing serio port
  Input: synaptics - use guard notation when pausing serio port
  Input: atkbd - use guard notation when pausing serio port
  Input: sunkbd - use guard notation when pausing serio port
  Input: synaptics-rmi4 - use guard notation when pausing serio port in F03
  Input: elo - use guard notation when pausing serio port
  Input: gscps2 - use guard notation when acquiring spinlock
  Input: hyperv-keyboard - use guard notation when acquiring spinlock
  Input: i8042 - tease apart interrupt handler
  Input: i8042 - use guard notation when acquiring spinlock
  Input: ps2-gpio - use guard notation when acquiring mutex
  Input: ps2mult - use guard notation when acquiring spinlock
  Input: q40kbd - use guard notation when acquiring spinlock
  Input: sa1111ps2 - use guard notation when acquiring spinlock
  Input: serport - use guard notation when acquiring spinlock
  Input: serio - use guard notation when acquiring mutexes and spinlocks
  Input: serio_raw - use guard notation for locks and other resources
  Input: serio-raw - fix potential serio port name truncation
  Input: sun4i-ps2 - use guard notation when acquiring spinlock
  Input: userio - switch to using cleanup functions
  Input: xilinx_ps2 - use guard notation when acquiring spinlock

 drivers/input/keyboard/atkbd.c        |   8 +-
 drivers/input/keyboard/sunkbd.c       |   5 +-
 drivers/input/mouse/alps.c            |   4 +-
 drivers/input/mouse/byd.c             |   5 +-
 drivers/input/mouse/synaptics.c       |   6 +-
 drivers/input/rmi4/rmi_f03.c          |   4 +-
 drivers/input/serio/gscps2.c          | 114 +++++----
 drivers/input/serio/hyperv-keyboard.c |  38 ++-
 drivers/input/serio/i8042.c           | 327 +++++++++++++-------------
 drivers/input/serio/libps2.c          |  28 ++-
 drivers/input/serio/ps2-gpio.c        |   4 +-
 drivers/input/serio/ps2mult.c         |  25 +-
 drivers/input/serio/q40kbd.c          |  10 +-
 drivers/input/serio/sa1111ps2.c       |   8 +-
 drivers/input/serio/serio.c           | 164 +++++--------
 drivers/input/serio/serio_raw.c       | 125 ++++------
 drivers/input/serio/serport.c         |  27 +--
 drivers/input/serio/sun4i-ps2.c       |   8 +-
 drivers/input/serio/userio.c          | 141 ++++++-----
 drivers/input/serio/xilinx_ps2.c      |  15 +-
 drivers/input/touchscreen/elo.c       |   8 +-
 include/linux/serio.h                 |   3 +
 22 files changed, 487 insertions(+), 590 deletions(-)

-- 
Dmitry

