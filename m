Received: from mail-yw1-f202.google.com (mail-yw1-f202.google.com [209.85.128.202])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C4FE3195392
	for <linux-sunxi@lists.linux.dev>; Wed,  5 Jun 2024 18:00:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.202
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717610403; cv=none; b=d0bXth+OkyxG9cSXK0Vzoic5ibzG3zGrkNIq9Nd6ynm8iY37w2AZoXG9g5SYQvDpbCwl1kzxIVjUChBUdBkFOIeutrQt7jw54h5nnOWDPxmWERytaFaGKD5F1gpLebSTJvSZZbr7Ys86rU6eD92odqeVvdG8XinFOsvWf6DNShk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717610403; c=relaxed/simple;
	bh=BxoABlKvJef+pUpKvjxVkdFoF53gAB3xVu8cHZaGBrk=;
	h=Date:Mime-Version:Message-ID:Subject:From:To:Cc:Content-Type; b=cjqV0xlYzJz0shcHaG4wB/mj046CBbbO7Sei/RPk+xRvHoY91gXNkbz/Q5HRGyuk6d33102uiKL+lvHDhNOqKKE3nl/KIDnK6nR/SQKetggYl3k2JYrwF7XfOPGercNGfpwSIDI/sZmPVDM7LAp9+Fzeul0xoYVwTiThi1znrtw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--joychakr.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=LjZtbqe7; arc=none smtp.client-ip=209.85.128.202
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--joychakr.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="LjZtbqe7"
Received: by mail-yw1-f202.google.com with SMTP id 00721157ae682-62a089511f9so15297987b3.1
        for <linux-sunxi@lists.linux.dev>; Wed, 05 Jun 2024 11:00:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1717610401; x=1718215201; darn=lists.linux.dev;
        h=cc:to:from:subject:message-id:mime-version:date:from:to:cc:subject
         :date:message-id:reply-to;
        bh=w5RPl7PD7LMs1k1njsQ/RXiUssQb7CTl+XBmOvI3R5A=;
        b=LjZtbqe7Mbu7hsag8TTaSLmfUgsd0P5tcog+0k8DymVSjQTaWlGyyqQL9biPJF2R6Z
         MDI/d6AMyH44io8jKhdKHPzmrNi8Wr8AS+ZRIc3hthACL9cbqswrNZKbfGxOFmkBDRhL
         Z3KXz3l/da1lA3RF2pS5gViZ3Gmy/WsE40kaYwwUPj5P8JGrkPJAKY1r9M5QNPwwtqYT
         8xU/007IDjBSnDG5MQnO0bUkyHjPlOyAmE4gaXV/n4bC8hudhoMAI8K2ADiL3gCDTeYC
         uSrMv6TbjESQiqprd8Z7gfhX9xcutMBBgVAksBG25Tv9/kg5Uf54lgs4Rd0ikEPMaF8Q
         9Tcg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1717610401; x=1718215201;
        h=cc:to:from:subject:message-id:mime-version:date:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=w5RPl7PD7LMs1k1njsQ/RXiUssQb7CTl+XBmOvI3R5A=;
        b=D7879jrzPfra08yVgUODK07K5C09puVQFTsZwklXv/P7ML273m12ktincrPszEnHkb
         GXQZX+AgXnCauic+2nhVOIwXbmnsGHwZPKdZYBC5o0IoLlAM9OtbH2ekWlA6ndx3s/d6
         Czdtii0zo8O+PT4fjpsBmuuCidb5ktawepe2hJ+yNNhb2jQQv+ZVXCivk6/PJQfJuhWa
         y400DxGmNi4NrbJJ/qOcM028f9VskmQlGWDS4OxmmaXU8JmqTRGwmH071L0Uxur0MwN6
         /ByMrEXpkH+V2mD2bArp9tPV45VIprlxRsZHIIcDhM31QEkCTuh66pdAHh13qpkg97IU
         CrvQ==
X-Forwarded-Encrypted: i=1; AJvYcCW47SGCap0U5NUglYUMzNFLYlUK6DAf9OmWOJdErfMEE6vf4CPN9K+W+WWyT2Lu6/tQRIc5gMhcMwmSuxWS7dE2ngEIp8cFVdqXM0o=
X-Gm-Message-State: AOJu0YygwYylArbxirMo5Ioy9rq0WKOsFR/0rUkopk7IdnneuJxevZZO
	MO6cR6y1B6ymBVKLFkcAVCeXFiE+2FGklx1iczVxvntHtiEzRyUvCV5aukDrllVP161YvpgYK1a
	IbxX5HpEQKw==
X-Google-Smtp-Source: AGHT+IE3beT3+LJiyuyeey70O4vTmt9cNoEU8h7bwGC3fodiNqs+98CXh8Kyq/MReppn/4vWIwzPR7Cf0wAFHw==
X-Received: from joychakr.c.googlers.com ([fda3:e722:ac3:cc00:4f:4b78:c0a8:6ea])
 (user=joychakr job=sendgmr) by 2002:a05:6902:987:b0:dfa:7552:e09e with SMTP
 id 3f1490d57ef6-dfade7e34cbmr71646276.0.1717610400689; Wed, 05 Jun 2024
 11:00:00 -0700 (PDT)
Date: Wed,  5 Jun 2024 17:59:44 +0000
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
X-Mailer: git-send-email 2.45.1.467.gbab1589fc0-goog
Message-ID: <20240605175953.2613260-1-joychakr@google.com>
Subject: [PATCH v1 00/17] nvmem: Handle change of return type in
 reg_read/write() definition
From: Joy Chakraborty <joychakr@google.com>
To: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
	Lars-Peter Clausen <lars@metafoo.de>, Sakari Ailus <sakari.ailus@linux.intel.com>, 
	Bingbu Cao <bingbu.cao@intel.com>, Zhihao Cheng <chengzhihao1@huawei.com>, 
	Jerome Brunet <jbrunet@baylibre.com>, 
	Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Cc: linux-hwmon@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-iio@vger.kernel.org, linux-media@vger.kernel.org, 
	linux-i2c@vger.kernel.org, linux-gpio@vger.kernel.org, 
	linux-mtd@lists.infradead.org, linux-rtc@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-amlogic@lists.infradead.org, 
	linux-sunxi@lists.linux.dev, linux-tegra@vger.kernel.org, 
	linux-usb@vger.kernel.org, manugautam@google.com, 
	Joy Chakraborty <joychakr@google.com>
Content-Type: text/plain; charset="UTF-8"

This patch series facilitates compilation post the change in definition
of nvmem_reg_read_t and nvmem_reg_write_t callback in
https://lore.kernel.org/all/171751721565.70889.16944298203785853489.b4-ty@linaro.org/

Currently the nvmem core change is picked on
https://git.kernel.org/pub/scm/linux/kernel/git/srini/nvmem.git/log/?h=for-next

---
V1 Changes : Change read/write return type to ssize_t and handle
relevant logic changes
---

Joy Chakraborty (17):
  hwmon: pmbus: adm1266: Change nvmem reg_read/write return type
  media: i2c: ov2740: Change nvmem reg_read/write return type
  media: i2c: video-i2c: Change nvmem reg_read/write return type
  iio: pressure: bmp280: Change nvmem reg_read/write return type
  misc: ds1682: Change nvmem reg_read/write return type
  misc: eeprom: at24: Change nvmem reg_read/write return type
  misc: eeprom: at25: Change nvmem reg_read/write return type
  misc: eeprom: 93xx46: Change nvmem reg_read/write return type
  misc: mchp_pci1xxxx: Change nvmem reg_read/write return type
  mtd: core: Change nvmem reg_read/write return type
  mtd: ubi: nvmem: Change nvmem reg_read/write return type
  soc: atmel: sfr: Change nvmem reg_read/write return type
  w1: slaves: w1_ds250x: Change nvmem reg_read/write return type
  thunderbolt: switch: Change nvmem reg_read/write return type
  thunderbolt: retimer: Change nvmem reg_read/write return type
  soc: tegra: fuse: Change nvmem reg_read/write return type
  rtc: Change nvmem reg_read/write return type

 drivers/hwmon/pmbus/adm1266.c                 |  4 +-
 drivers/iio/pressure/bmp280-core.c            | 14 ++++---
 drivers/media/i2c/ov2740.c                    |  6 +--
 drivers/media/i2c/video-i2c.c                 |  9 +++--
 drivers/misc/ds1682.c                         | 16 +++-----
 drivers/misc/eeprom/at24.c                    | 10 +++--
 drivers/misc/eeprom/at25.c                    | 11 +++---
 drivers/misc/eeprom/eeprom_93xx46.c           | 12 +++---
 .../misc/mchp_pci1xxxx/mchp_pci1xxxx_otpe2p.c | 16 ++++----
 drivers/mtd/mtdcore.c                         | 18 ++++-----
 drivers/mtd/ubi/nvmem.c                       |  6 +--
 drivers/rtc/rtc-abx80x.c                      | 15 +++----
 drivers/rtc/rtc-cmos.c                        |  8 ++--
 drivers/rtc/rtc-ds1305.c                      | 18 ++++++---
 drivers/rtc/rtc-ds1307.c                      | 22 +++++++----
 drivers/rtc/rtc-ds1343.c                      | 18 ++++++---
 drivers/rtc/rtc-ds1511.c                      | 12 +++---
 drivers/rtc/rtc-ds1553.c                      | 14 ++++---
 drivers/rtc/rtc-ds1685.c                      | 14 ++++---
 drivers/rtc/rtc-ds1742.c                      | 14 ++++---
 drivers/rtc/rtc-ds3232.c                      | 22 +++++++----
 drivers/rtc/rtc-isl12026.c                    | 12 +++---
 drivers/rtc/rtc-isl1208.c                     |  8 ++--
 drivers/rtc/rtc-m48t59.c                      | 12 +++---
 drivers/rtc/rtc-m48t86.c                      | 12 +++---
 drivers/rtc/rtc-max31335.c                    | 18 ++++++---
 drivers/rtc/rtc-meson.c                       | 18 ++++++---
 drivers/rtc/rtc-omap.c                        | 12 +++---
 drivers/rtc/rtc-pcf2127.c                     | 20 ++++++----
 drivers/rtc/rtc-pcf85063.c                    | 20 +++++++---
 drivers/rtc/rtc-pcf85363.c                    | 39 ++++++++++++-------
 drivers/rtc/rtc-rp5c01.c                      | 14 ++++---
 drivers/rtc/rtc-rv3028.c                      | 32 +++++++++------
 drivers/rtc/rtc-rv3029c2.c                    | 20 +++++++---
 drivers/rtc/rtc-rv3032.c                      | 24 ++++++++----
 drivers/rtc/rtc-rv8803.c                      | 16 +++++---
 drivers/rtc/rtc-rx8581.c                      | 39 ++++++++++++-------
 drivers/rtc/rtc-stk17ta8.c                    | 14 ++++---
 drivers/rtc/rtc-sun6i.c                       |  8 ++--
 drivers/rtc/rtc-ti-k3.c                       | 16 +++++---
 drivers/rtc/rtc-twl.c                         | 20 +++++++---
 drivers/soc/atmel/sfr.c                       | 11 ++++--
 drivers/soc/tegra/fuse/fuse-tegra.c           |  6 +--
 drivers/thunderbolt/retimer.c                 |  8 ++--
 drivers/thunderbolt/switch.c                  |  8 ++--
 drivers/w1/slaves/w1_ds250x.c                 |  4 +-
 46 files changed, 408 insertions(+), 282 deletions(-)

-- 
2.45.1.467.gbab1589fc0-goog

