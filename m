Received: from mail-wr1-f52.google.com (mail-wr1-f52.google.com [209.85.221.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 78F0D79D2
	for <linux-sunxi@lists.linux.dev>; Thu, 10 Oct 2024 21:25:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728595561; cv=none; b=NDTVQVf+sV/Ta4vbjtUuEIRdKz7EK0zzrZluBTQ+CzkbQejM3k7tkkfukFALQ+63d75m8d2ql7tDENpRjJbZZGun1zzggt4evijzTV+SQLV8TNYR7wNZeVW3rLPV34NW9+rNOLPHRfWLsuPreL5xvTa6vut6ZIpfxi3UA2IE5m0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728595561; c=relaxed/simple;
	bh=H3QCDpR4l7Ykj3GCahYdrBiVlspqgJ1J9/SZlkURrtU=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=Zdb8cMjMwk2Vr7ZQ1my/Mo60qP3ikuSzl7EZuVdWIcsp3QnI7Avgh2inPeAkp/oSNMbT+hG/QYtKvNWABtb+LORRU9qgqXc1L8sGu0cMVujIedyP2NEnDIa2l3ataBYXaRxQUXIE0BIzLnXosftY2uGx4UiG4FQN9VC9Vmdckp0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=L8MYLQPZ; arc=none smtp.client-ip=209.85.221.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="L8MYLQPZ"
Received: by mail-wr1-f52.google.com with SMTP id ffacd0b85a97d-37d51055097so478197f8f.3
        for <linux-sunxi@lists.linux.dev>; Thu, 10 Oct 2024 14:25:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1728595558; x=1729200358; darn=lists.linux.dev;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=eJW7O5XKUbOuuqLLX5pzcTQ1E4Av2AR4QeFhDmOQC8k=;
        b=L8MYLQPZvDZJa9QIsyiCGICtvuFdgWgSOgSTnANZMKIzk1aGbsKq+aBN5vOYnQgwBf
         CQ5aY8TNDxbRRVsGNczNRhYXAXdAftF5BFMrj7sPGt+zb0asXB1qXzfvqNRHZjfj/OCm
         8jz6+SUmlYQUay/KVBUH8wMia2f/E0zrkWUTGOORu6EGqDjaXrsmwUqzrUERy74WCobS
         m15Dy4Dfd48eepCA8v65W5NMGzCz6Ndq6Sfkm13UxmLsrtKEvX9uI4zQiPrA2yE7FVc9
         HVyHAZTUbeb5ay3TkwZcwFa33YybZ8YohgDExeinHxUZ5W6Udvv87OHKtCc5R+ZeRDgU
         M02Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728595558; x=1729200358;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=eJW7O5XKUbOuuqLLX5pzcTQ1E4Av2AR4QeFhDmOQC8k=;
        b=CIXq/GHDsHcBJrLl5h93SFgs/sAzpzrpcmZCZgHh3I+iv8sJqzihPCpcji+FNW0ghf
         wfwV1D0rtfgFozSiBycbkTLsrlt67cD0Th+n4dmsM9L09UTfmcXby5ioHd59KVK1a66h
         V5n/yA4VG6NCPX1UuZJxnbzeA321jfeMeId9RynG6ePt6+yKVYN+xJkgfSNKPAxGtsbI
         HWnL4lHdMVUYF9WldZG+XTgX4ESXzK1XlcuZTYU9Xn3gT9iLLSp7BSnvgnOCPwSZNwTN
         USrqYSY/qpxkmk/NlDusCtScxiGMwnPFZCIGimSWSLcdPu5U1oukg04ku1q55kO2FDzg
         5wAw==
X-Forwarded-Encrypted: i=1; AJvYcCXmQ4EhOE87ad2KQd1uhCP1Q9SgtiMMXKQCf5un1yvGjPT485D7+L/au69pOFKKIa3BvZrGZhR1CqklOg==@lists.linux.dev
X-Gm-Message-State: AOJu0Yxua4eqrr/2sgpXFFU24qC1Zl7npLZgJtQ1K0UBil0QVtFaUkmC
	5rMLax99/sl5wmJdaIk2AeARlXIVmzXWDFdaDja2A0W5FC1d6e+s
X-Google-Smtp-Source: AGHT+IGjhjvs23XBaF9qo7yUB6Onp+okLGqfHWsTl1zeKUZJoKhghxIMshywkcca8h+/0cILKz7jtQ==
X-Received: by 2002:a5d:5641:0:b0:37d:4a2d:6948 with SMTP id ffacd0b85a97d-37d552375b6mr274533f8f.33.1728595557711;
        Thu, 10 Oct 2024 14:25:57 -0700 (PDT)
Received: from [127.0.1.1] (2a02-8389-41cf-e200-3d08-841a-0562-b7b5.cable.dynamic.v6.surfer.at. [2a02:8389:41cf:e200:3d08:841a:562:b7b5])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-37d4b6a8940sm2402083f8f.6.2024.10.10.14.25.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 10 Oct 2024 14:25:56 -0700 (PDT)
From: Javier Carrasco <javier.carrasco.cruz@gmail.com>
Subject: [PATCH 00/10] input: automate of_node_put() calls for device_node
Date: Thu, 10 Oct 2024 23:25:50 +0200
Message-Id: <20241010-input_automate_of_node_put-v1-0-ebc62138fbf8@gmail.com>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAF5GCGcC/x3MQQqAIBBA0avErBNUamFXiRDTsWaRhloE0t2Tl
 u8vfoWMiTDD1FVIeFOmGBpE34HdTdiQkWsGyeUgOFeMwnkVba4SD1NQR69DdKhbZGI1qPxouXQ
 K2uBM6On55/Pyvh//OD7kbAAAAA==
To: Dmitry Torokhov <dmitry.torokhov@gmail.com>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 Hans de Goede <hdegoede@redhat.com>, Chen-Yu Tsai <wens@csie.org>, 
 Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Samuel Holland <samuel@sholland.org>, 
 Florian Fainelli <florian.fainelli@broadcom.com>, 
 Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>
Cc: linux-input@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, 
 linux-sunxi@lists.linux.dev, linux-rpi-kernel@lists.infradead.org, 
 Javier Carrasco <javier.carrasco.cruz@gmail.com>
X-Mailer: b4 0.14-dev
X-Developer-Signature: v=1; a=ed25519-sha256; t=1728595555; l=3941;
 i=javier.carrasco.cruz@gmail.com; s=20240312; h=from:subject:message-id;
 bh=H3QCDpR4l7Ykj3GCahYdrBiVlspqgJ1J9/SZlkURrtU=;
 b=ts+Lle7wL/NftURW4LFEavUzl5GrcOSKdRmgSDAOu1aMNej5jIzm2CTRgJNXE6hx7mfQRYjjT
 +ApNZbKfUf5BWFg+9nvAGVEh/pTZoGKhLCO94Qdp2GRbQN2Bm16D02B
X-Developer-Key: i=javier.carrasco.cruz@gmail.com; a=ed25519;
 pk=lzSIvIzMz0JhJrzLXI0HAdPwsNPSSmEn6RbS+PTS9aQ=

This series removes the explicit calls to 'of_node_put()' from the input
subsystem, either by switching from 'for_each_child_of_node()' to its
scoped variant 'for_each_child_of_node_scoped()', or by adding the
cleanup attribute to the device_node by means of the '__free()' macro.

This series simplifies the code in some cases, and it makes it in
general more robust, as it will avoid memory leaks if early returns are
added without the required call to 'of_node_put()', which is a rather
common issue.

The following drivers unconditionally release the device node after
using it:

  - misc/twl4030-vibra.c ('of_node_put()' under an if, but only if the
    node received a valid value).
  - misc/sparcspkr.c
  - serio/i8042-sparcio.h
  - touchscreen/raspberrypi-ts.c
  - touchscreen/ts4800-ts.c

The usage of the cleanup faciliy for these drivers offers no real gain
at the moment, but as soon as an error path is added to them, things can
go wrong, as it has happened multiple times with such nodes. I intended
to remove this error-prone pattern from the subsystem, so it is not
"borrowed" by new users. But if someone has strong feelings about the
automatic cleanup for those drives, I will not complain if they are left
as they are (at least until a new buggy error path is introduced ;)).

The approach for the variable declaration is the one that has been
followed in previous clean ups: as near as possible to its usage,
instead of at the top. I have no strong feelings about that either, but
I would prefer it that way for consistency and to have a common pattern
for future additions.

A single call to 'of_node_put()' has been left behind in rmi4/rmi_bus.c,
as it is used to release a node passed as a parameter, which would make
the use of the cleanup attribute too cumbersome for no real gain. It is
called unconditionally, and it will probably not be used as a common
pattern for new users of a device_node.

There has been some previous work from Dmitry to use the cleanup
facilities for 'fwnode_handle' and mutexes[1][2], which this series
aims to complement for 'device_node'.

Link: https://lore.kernel.org/linux-input/20240904044244.1042174-1-dmitry.torokhov@gmail.com/ [1]
Link: https://lore.kernel.org/linux-input/20240825051627.2848495-1-dmitry.torokhov@gmail.com/ [2]

Signed-off-by: Javier Carrasco <javier.carrasco.cruz@gmail.com>
---
Javier Carrasco (10):
      Input: cap11xx - switch to for_each_child_of_node_scoped
      Input: mtk-pmic-keys - switch to for_each_child_of_node_scoped
      Input: sun4i-lradc-keys - switch to for_each_child_of_node_scoped
      Input: twl6040-vibra - use cleanup facility for device_node
      Input: twl4030-vibra - use cleanup facility for device_node
      Input: sparcspkr - use cleanup facility for device_node
      Input: 88pm860x - use cleanup facility for device_node
      Input: i8042 - use cleanup facility for device_node
      Input: raspberrypi-ts - use cleanup facility for device_node
      Input: ts4800-ts - use cleanup facility for device_node

 drivers/input/keyboard/cap11xx.c           | 12 ++++--------
 drivers/input/keyboard/mtk-pmic-keys.c     | 17 +++++------------
 drivers/input/keyboard/sun4i-lradc-keys.c  |  7 ++-----
 drivers/input/misc/sparcspkr.c             |  4 +---
 drivers/input/misc/twl4030-vibra.c         | 11 +++--------
 drivers/input/misc/twl6040-vibra.c         |  8 ++------
 drivers/input/serio/i8042-sparcio.h        |  6 +-----
 drivers/input/touchscreen/88pm860x-ts.c    | 20 +++++++-------------
 drivers/input/touchscreen/raspberrypi-ts.c |  4 +---
 drivers/input/touchscreen/ts4800-ts.c      |  5 ++---
 10 files changed, 28 insertions(+), 66 deletions(-)
---
base-commit: 515ef92b4939fa51f9f1ee278618e2d419b0b8b0
change-id: 20241009-input_automate_of_node_put-1bae9f5c02d9

Best regards,
-- 
Javier Carrasco <javier.carrasco.cruz@gmail.com>

