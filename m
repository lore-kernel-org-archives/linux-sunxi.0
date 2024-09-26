Received: from mail-ej1-f46.google.com (mail-ej1-f46.google.com [209.85.218.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A8D5C1B011E
	for <linux-sunxi@lists.linux.dev>; Thu, 26 Sep 2024 23:21:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727392880; cv=none; b=sJk4cSZ/hiEAhxUF5niO/fO8kuVeh537MC2TSAQKGlWa0IyNX/U6VfQAGm1uWqRWan+j7/bGpgXD1uj4YTA1kNd1mEhWTQU+fF6ImRXXmQjpniijaKHa3/EP0lU6N/9EtJ8kVPMau4Ld2nuUpNbgaK/mf2qSATlY3W8N4rwp74c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727392880; c=relaxed/simple;
	bh=ls6STftDXgqEjSON3lpk60MstLtR+0wj4jS0gZeSDb0=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=p8SZyDZBHnhftHAh9iMY6d1/8HZR2sRbzmJzh8zIeLG89qqm4IUiY62MXUJTJZIYFPAnkpjLQH4195rkNj/Lcpda3p2wNUL8X8hfoq2tLbRJM31/3wUiThrXWAIF4bRf9Zhbz+shIDOJVvIofcCpmEj0oVVtnsTyZg2PJLtRlqs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=OKOJI3rS; arc=none smtp.client-ip=209.85.218.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="OKOJI3rS"
Received: by mail-ej1-f46.google.com with SMTP id a640c23a62f3a-a8d4093722bso207890266b.0
        for <linux-sunxi@lists.linux.dev>; Thu, 26 Sep 2024 16:21:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1727392876; x=1727997676; darn=lists.linux.dev;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=Bu40LWj131EvrXy4hSGWlLWhDgrzKYj+PB2hYeDUiWQ=;
        b=OKOJI3rS9TcszxGCycoi7wmOfNSCAhCvirsHzIgsLDNwQeW32pPsSVEj+0S7vk5GtT
         FpNiygpiHN75PDGuz/i3hC7bwgC34d5qS3jPO/Cl+/8iyaciSTxyJ46ONosxMtQM1qcr
         XIlofNimWJGfnx/iEhzYOIgoSSUCmFVzG5f7yG2XoI1+sIjCLO84AI+8LeFF4LHLxYqo
         Vy68kSehAiVM1FA/jVNc1Vv0MM/4sS1gFzVMWu2iFjrt30mpKdu8EyPYMi6c2Px+6+CA
         7hWjvT9ThCeWm03ef5Mvh4xmBW7JDxjmjT7HT1xJil4YyrJPdffWnTZ0JQfvkewPiC5n
         Q91g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1727392876; x=1727997676;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Bu40LWj131EvrXy4hSGWlLWhDgrzKYj+PB2hYeDUiWQ=;
        b=m60OR4wrhf9uwZItdn9Zgp6azrtxis1HmVvMCLOQBteXDp+iyihsagsiVkf9/Xs35P
         GzmxO6uGXLkYeShMahEPzhbPu0sANfQ8yjQGBlnEfuxtN3VlmV2hmhKVJmB+cOvFzHzP
         8TGIluJ267zqu6zQrHA1IAoiBX473YXfGPe31HdI1ae/Atd1iFrRPd1m7BQk/JkFt6EL
         Eo+jdn0nXUVz8jhjQ2Uvbz3/K3Q9dPz8xOh7p73FV4rdHWmOmREM4I6YtuNRO5z4Uax9
         MbEwRrHUh4Xgf+soKPt/K0VVSwYQ7o/icFScO1Dkd+YK8qHA8EqfOwRcDD5MwkBIs6OS
         wihw==
X-Forwarded-Encrypted: i=1; AJvYcCUFT2P8e5KMLL5RHaBxjMcpLU6/XLb8IXcOs81e4n5cpvQteya1lgehZiA7AscXFJxcLj/2ma5SkVuaDg==@lists.linux.dev
X-Gm-Message-State: AOJu0YxqOQLmPXtwB/eIWjfEJEUJhPOKvItoU6NU5QHgSGguqBOdk2Vd
	35K+w3uEDsMDrpl14AQbElklupIGw04ECtGbNatI5QqByG4CWIP6
X-Google-Smtp-Source: AGHT+IHhqjy8WeTtGJCjL8APo5icRaeNMZCgJdUWodmCHHiaovrWOaRpdybBZblfcBNu/LZxuuDbbQ==
X-Received: by 2002:a17:907:9488:b0:a8c:d6a3:d038 with SMTP id a640c23a62f3a-a93c492a74emr81977066b.37.1727392875801;
        Thu, 26 Sep 2024 16:21:15 -0700 (PDT)
Received: from [127.0.1.1] (2a02-8389-41cf-e200-3989-b03c-7705-998b.cable.dynamic.v6.surfer.at. [2a02:8389:41cf:e200:3989:b03c:7705:998b])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a93c27773c0sm50368166b.1.2024.09.26.16.21.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Sep 2024 16:21:15 -0700 (PDT)
From: Javier Carrasco <javier.carrasco.cruz@gmail.com>
Subject: [PATCH 00/18] leds: switch to device_for_each_child_node_scoped()
Date: Fri, 27 Sep 2024 01:20:51 +0200
Message-Id: <20240927-leds_device_for_each_child_node_scoped-v1-0-95c0614b38c8@gmail.com>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAFPs9WYC/x2N0QqDMAwAf0XyvIJ2duB+ZYxQktQGpJUGhiD++
 4qPB8fdCSZNxeA9nNDkp6a1dJgeA1COZRWn3Bn86Odx8S+3CRtyN0kw1YYSKSNl3RhLZUGjugu
 7EJfgQ5inZ4rQY3uTpMc9+nyv6w9hSLI6eAAAAA==
To: Pavel Machek <pavel@ucw.cz>, Lee Jones <lee@kernel.org>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 Gene Chen <gene_chen@richtek.com>, 
 Jacek Anaszewski <jacek.anaszewski@gmail.com>, 
 Bartosz Golaszewski <brgl@bgdev.pl>, Chen-Yu Tsai <wens@csie.org>, 
 Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Samuel Holland <samuel@sholland.org>, 
 Jonathan Cameron <Jonathan.Cameron@huawei.com>
Cc: linux-leds@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, 
 linux-sunxi@lists.linux.dev, 
 Javier Carrasco <javier.carrasco.cruz@gmail.com>, stable@vger.kernel.org
X-Mailer: b4 0.14-dev
X-Developer-Signature: v=1; a=ed25519-sha256; t=1727392874; l=3800;
 i=javier.carrasco.cruz@gmail.com; s=20240312; h=from:subject:message-id;
 bh=ls6STftDXgqEjSON3lpk60MstLtR+0wj4jS0gZeSDb0=;
 b=TYJknx8sMFUvP50SESSmj7bX6NpKm2bRxPVZmfQ4I0CTAI78hmnfsvCgYNyfMfsr3Zzok4S+j
 J2NN3jjMDyzDfwjCYYydsp8LC3zBAjJbrjq41NeJcSn3DU93waqFbfe
X-Developer-Key: i=javier.carrasco.cruz@gmail.com; a=ed25519;
 pk=lzSIvIzMz0JhJrzLXI0HAdPwsNPSSmEn6RbS+PTS9aQ=

This series switches from the device_for_each_child_node() macro to its
scoped variant, which in general makes the code more robust if new early
exits are added to the loops, because there is no need for explicit
calls to fwnode_handle_put(). Depending on the complexity of the loop
and its error handling, the code gets simplified and it gets easier to
follow.

The non-scoped variant of the macro is error-prone, and it has been the
source of multiple bugs where the child node refcount was not
decremented accordingly in error paths within the loops. The first patch
of this series is a good example, which fixes that kind of bug that is
regularly found in node iterators.

The uses of device_for_each_child_node() with no early exits have been
left untouched because their simpilicty justifies the non-scoped
variant.

Note that the child node is now declared in the macro, and therefore the
explicit declaration is no longer required.

The general functionality should not be affected by this modification.
If functional changes are found, please report them back as errors.

Signed-off-by: Javier Carrasco <javier.carrasco.cruz@gmail.com>
---
Javier Carrasco (18):
      leds: flash: mt6360: fix device_for_each_child_node() refcounting in error paths
      leds: flash: mt6370: switch to device_for_each_child_node_scoped()
      leds: flash: leds-qcom-flash: switch to device_for_each_child_node_scoped()
      leds: aw200xx: switch to device_for_each_child_node_scoped()
      leds: cr0014114: switch to device_for_each_child_node_scoped()
      leds: el15203000: switch to device_for_each_child_node_scoped()
      leds: gpio: switch to device_for_each_child_node_scoped()
      leds: lm3532: switch to device_for_each_child_node_scoped()
      leds: lm3697: switch to device_for_each_child_node_scoped()
      leds: lp50xx: switch to device_for_each_child_node_scoped()
      leds: max77650: switch to device_for_each_child_node_scoped()
      leds: ns2: switch to device_for_each_child_node_scoped()
      leds: pca963x: switch to device_for_each_child_node_scoped()
      leds: pwm: switch to device_for_each_child_node_scoped()
      leds: sun50i-a100: switch to device_for_each_child_node_scoped()
      leds: tca6507: switch to device_for_each_child_node_scoped()
      leds: rgb: ktd202x: switch to device_for_each_child_node_scoped()
      leds: rgb: mt6370: switch to device_for_each_child_node_scoped()

 drivers/leds/flash/leds-mt6360.c       |  3 +--
 drivers/leds/flash/leds-mt6370-flash.c | 11 +++-------
 drivers/leds/flash/leds-qcom-flash.c   |  4 +---
 drivers/leds/leds-aw200xx.c            |  7 ++-----
 drivers/leds/leds-cr0014114.c          |  4 +---
 drivers/leds/leds-el15203000.c         | 14 ++++---------
 drivers/leds/leds-gpio.c               |  9 +++------
 drivers/leds/leds-lm3532.c             | 18 +++++++----------
 drivers/leds/leds-lm3697.c             | 18 ++++++-----------
 drivers/leds/leds-lp50xx.c             | 21 +++++++------------
 drivers/leds/leds-max77650.c           | 18 ++++++-----------
 drivers/leds/leds-ns2.c                |  7 ++-----
 drivers/leds/leds-pca963x.c            | 11 +++-------
 drivers/leds/leds-pwm.c                | 15 ++++----------
 drivers/leds/leds-sun50i-a100.c        | 27 +++++++++----------------
 drivers/leds/leds-tca6507.c            |  7 ++-----
 drivers/leds/rgb/leds-ktd202x.c        |  8 +++-----
 drivers/leds/rgb/leds-mt6370-rgb.c     | 37 ++++++++++------------------------
 18 files changed, 75 insertions(+), 164 deletions(-)
---
base-commit: 92fc9636d1471b7f68bfee70c776f7f77e747b97
change-id: 20240926-leds_device_for_each_child_node_scoped-5a95255413fa

Best regards,
-- 
Javier Carrasco <javier.carrasco.cruz@gmail.com>

