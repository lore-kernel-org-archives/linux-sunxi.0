Received: from mail-ej1-f54.google.com (mail-ej1-f54.google.com [209.85.218.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7A5FA41A80
	for <linux-sunxi@lists.linux.dev>; Fri,  3 May 2024 17:52:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1714758760; cv=none; b=qJSnOIcK1/jbpfgf/crPOL9vh35KehHiAhzQnoLzfiSJqw1zjVj7R6mDy3zts2GA2//53/I9VDmvatH1HLZTkFIk41+IIYVurEIVdFVnZ6lx1ye6G6wpDMLV8wZdUAqCC05MqukTQvPbSRGymLrAeOacIP2PlI82uCMuCuet+IA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1714758760; c=relaxed/simple;
	bh=26lFkDSslFUBARmxaoBwnZXKXDz1wLRsTHBw5LcZKiA=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=SZo6DDgcq+IilL7pykr30HssX6FELnLBIy/Fn2cgQ8xlpdkMfXfmgHCfTEtBNHEHRjkN8KUkRHvQJ88N4T11WQEvan3URdX665M9sBQBKNsAzdq45Mrgs7wdZ/bQLNFpYgBhYM6HBGgFuV9OpCs326zIAv156rGoP+QnbOO/kCE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ACpi2cnB; arc=none smtp.client-ip=209.85.218.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ACpi2cnB"
Received: by mail-ej1-f54.google.com with SMTP id a640c23a62f3a-a5991a443b1so211911566b.1
        for <linux-sunxi@lists.linux.dev>; Fri, 03 May 2024 10:52:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1714758757; x=1715363557; darn=lists.linux.dev;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=S5Lj7EMp57A1ZOWJ8YtZlI8QLrZzM8FZK+WR00Wk7Lw=;
        b=ACpi2cnBRhOulxjzJkgFsGI70irNcF0pfAVdoMohMtFIuw6fup5I+VPfoN/zu0Knje
         mtLVSMK6JpQF/3r3lAwOjT6Bw44TWn6pZ015pQSHnBV62HDn0uHdGs35EGG+XcsSULzZ
         Cgzk0zTOfeYYxvsB1tnavtkw9IpLF1ce9edaW5Mqo7dUkIzCi/XWsnzhOh0w/agaWSkr
         145YPKO2DfdmZakLeI5SUi9Umtc8Nzugnmc3VMUins4C5clBHp+lb3Dlj0WSc5KxaxK2
         mjQV2oNHeB6cEG4Zezc/NE60dhbr3BWhEeGFLcOCf6pvPYXxaB+24D2yLlkiPzEy7qyf
         AmEA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1714758757; x=1715363557;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=S5Lj7EMp57A1ZOWJ8YtZlI8QLrZzM8FZK+WR00Wk7Lw=;
        b=LjRPSf7yuCSvxea9+bNyTfwLDZAumWbzFGiL4RJb3uJdEEPRQ4jgjT3qUKeVjz4CDc
         v0gdf1FGeCT6Fah+P63+JOYKdhfUZwbXwsASoXvT+61xKBOo/yKHGfoJMofENeaVNMkr
         zLQL08vUCeK9suYFK36U9IZ2TpOu1fg7p1bnff9PnqbhYHRcpQbd97RCMIuZNjQ0RRUE
         2uVKOppcGTQRrRX32SWSR0cmAdVCJ8rAUvo7Q9Veg/RaVET6QtsqFw2BN+5fZUR6YhGN
         6Pqv+m5kw4dch9mYXnwXEZAHEYySFVHpONztDAlCoftgS0eTWJZ6CpsssoAv3B+ksLnj
         K8xQ==
X-Forwarded-Encrypted: i=1; AJvYcCVRGw7FDHCfATlPreO44FPSoBRCqpbvZk2eHbRP8OHsQeXnQZpHtfNzyxIm1C5rasNWLL8uDq+V4fizjLrw1JbMcH0bUV3cuKUQo/8=
X-Gm-Message-State: AOJu0YxBRznAKcpue+VDzopPUUKG+MJ/FadYGb4g/h+1Ivzd6XwUss8V
	uUIrWL0+9wAD22mn1Sqm2DaxkOlpntT+2/L8i7/27xnp7T0SDJDZ
X-Google-Smtp-Source: AGHT+IF4dsd0FfkWVX3KX+wiy07pKW/AhU4MNhSgBTpRv5E/JETN74/vLWBFDE0BMS4HIFD2W3PVxQ==
X-Received: by 2002:a50:a696:0:b0:568:d5e7:37a1 with SMTP id e22-20020a50a696000000b00568d5e737a1mr2215751edc.36.1714758756804;
        Fri, 03 May 2024 10:52:36 -0700 (PDT)
Received: from [127.0.1.1] (84-115-213-47.cable.dynamic.surfer.at. [84.115.213.47])
        by smtp.gmail.com with ESMTPSA id q28-20020a50aa9c000000b00572469a7948sm1968368edc.45.2024.05.03.10.52.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 03 May 2024 10:52:36 -0700 (PDT)
From: Javier Carrasco <javier.carrasco.cruz@gmail.com>
Subject: [PATCH 0/2] cpufreq: sun50i: fix memory leak and remove
 of_node_put()
Date: Fri, 03 May 2024 19:52:31 +0200
Message-Id: <20240503-sun50i-cpufreq-nvmem-cleanup-v1-0-0a2352cac46b@gmail.com>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAF8kNWYC/x3MwQqDMAwA0F+RnBeIrpXhr8gOpaYa0Ky2VAbiv
 1s8vss7IXMSzjA0JyQ+JMtPK9pXA35xOjPKVA0ddYYsvTEXtSToYwmJd9Rj4w39yk5LREPO+PA
 JzvYT1CImDvJ/+vF7XTdx4KIFbgAAAA==
To: Yangtao Li <tiny.windzz@gmail.com>, 
 "Rafael J. Wysocki" <rafael@kernel.org>, 
 Viresh Kumar <viresh.kumar@linaro.org>, Chen-Yu Tsai <wens@csie.org>, 
 Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Samuel Holland <samuel@sholland.org>, 
 Andre Przywara <andre.przywara@arm.com>, 
 Jonathan Cameron <Jonathan.Cameron@huawei.com>
Cc: linux-pm@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-sunxi@lists.linux.dev, linux-kernel@vger.kernel.org, 
 Javier Carrasco <javier.carrasco.cruz@gmail.com>
X-Mailer: b4 0.14-dev
X-Developer-Signature: v=1; a=ed25519-sha256; t=1714758755; l=1729;
 i=javier.carrasco.cruz@gmail.com; s=20240312; h=from:subject:message-id;
 bh=26lFkDSslFUBARmxaoBwnZXKXDz1wLRsTHBw5LcZKiA=;
 b=SAyC1/2rpo7KrfqQ3wLlae9m8UXTOYb4VAe330AWXXwusl1ENis3BtDioVvV8r8YDz5yvQHKR
 QzpMy9YoqUzBxOEAK9wzbzCFss4+EKjtvl/cpdv2TW5D/WLnigd2ZJ6
X-Developer-Key: i=javier.carrasco.cruz@gmail.com; a=ed25519;
 pk=lzSIvIzMz0JhJrzLXI0HAdPwsNPSSmEn6RbS+PTS9aQ=

This series fixes a memory leak by means of the _scoped version of the
for_each_child_of_node() loop, which was recently introduced with
34af4554fb0c ("of: Introduce for_each_*_child_of_node_scoped() to
automate of_node_put() handling").

The new approach is still not widely used, but this might be a good
occasion to use it in a driver because it actually fixes a bug, and
the loop is rather simple.

The creator of the new macro was added to the discussion in case the
new approach is still not mature enough, even for such simple case.

Additionally, the existing uses of of_node_put() have been removed to
favour the _free() cleanup handler, which reduces the chances of having
any other memory leak because some of_node_put() is missing as well as
simplifies the current code.

I don't have the real hardware to test the series, so I "faked" the node
in a device tree for an arm64 device (Rockchip) and hacked the driver
to get to run dt_has_supported_hw(). The new implementation works as
expected, but if someone wants to test it with the proper SoC,
additional tests are always welcome. The same applies for the removals
of of_node_put().

Signed-off-by: Javier Carrasco <javier.carrasco.cruz@gmail.com>
---
Javier Carrasco (2):
      cpufreq: sun50i: fix memory leak in dt_has_supported_hw()
      cpufreq: sun50i: replace of_node_put() with automatic cleanup handler

 drivers/cpufreq/sun50i-cpufreq-nvmem.c | 27 +++++++++------------------
 1 file changed, 9 insertions(+), 18 deletions(-)
---
base-commit: 9221b2819b8a4196eecf5476d66201be60fbcf29
change-id: 20240503-sun50i-cpufreq-nvmem-cleanup-40a4cf8fa56d

Best regards,
-- 
Javier Carrasco <javier.carrasco.cruz@gmail.com>

