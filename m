Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1AFD6406811
	for <linux-sunxi@lists.linux.dev>; Mon, 29 Jun 2026 12:42:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782736952; cv=none; b=qLJH/Ll7E6q4Wol10MG/h0UapXv5AmsHuVpPHRer6uR2ZZj5PN+RdTTPOL54PaKm6wd8FVm8QW5HAIn1pTLrcDIyhzfDrXTr7wmNx6iz8fITkVbV74R/C6NmQrxRzM4o+y4EeHamkeQoYiAGGqp+VnLrqjbHL8reNVDhuSIX6xE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782736952; c=relaxed/simple;
	bh=Jpxu3JhIRQUn0r/J9h/BIiZQMvK4hOfLEjUDM7I8VOM=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=F5kazBTIjzpbIQZOydIy8pMNUnZuWlNpMdRi4WabxQ098gr2EKAa6ZvErtLzF0O31ANcn6QWKn6jeGegoRGDUysYxsViJ7+8eLPJAaK78m/YQfISeMieaI8hKc3bE3t/ihlwXkp3WatscboekvcXAgWqaqELh2SkCbxgEYXszjQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.b=Sl+Shs+V; arc=none smtp.client-ip=209.85.128.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.b="Sl+Shs+V"
Received: by mail-wm1-f50.google.com with SMTP id 5b1f17b1804b1-493a54b80a5so21166945e9.2
        for <linux-sunxi@lists.linux.dev>; Mon, 29 Jun 2026 05:42:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1782736948; x=1783341748; darn=lists.linux.dev;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=4XQk6u/zxmHQYXaSkoQG9T9QM+F2QSnLo28ZDiX6Yck=;
        b=Sl+Shs+VPv73zoBncLFaTtrd+16MKH21RlPLxUELjmcrVjghFKbs0JZrO+OfLDnkZV
         s0Ec79MlJXsKSZiXFtnP+1pYIVH1Yg8LGus7rUsa+97qh+PhYzuWHyzjP99D1LFIQLIU
         bEZPJkX72GSLxMPl5gJqIdTdOy++Y4/+9Opp26HjQ4WZY+PrtxoWb+kGWJW9BRTbNazB
         kflgGArG1xKknl76RdhfO8VifZmDsUnfwDOo4pfNG5c8gim4oIwc0JO8BKbg6okkXu9e
         /ugQ066Ryd91UlB3eQgPcppQTGKdgyYtIHsuQW/xT8HWNw+8ty2fPjcmA1fJeAD1Jlyv
         01hw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782736948; x=1783341748;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=4XQk6u/zxmHQYXaSkoQG9T9QM+F2QSnLo28ZDiX6Yck=;
        b=bn+R6JQ93vdB8K8ET5nmHUITNoND9X48uxWMWHJ0uX77IXn6yMnN0aguI0PfoGIEo1
         IasHST00KTnhOy9GhxYAeuUt0D5v326zr3fOCbjPhmD0dq3yV37ectp4sQilzNhNa/GF
         IaL9FG8x0UlEnWfM3b6a/uBhnzlMQZc+CMHqSFxReEHfQV8II9kHOjd8YRsz4AeVgZYQ
         sIA0ZtDTCSinZxSFdrbTyUf+f0bpK23Gbr8CGkzATdRFdctAo6KSTv9685ESC8sdgxLE
         WGToUdfjJ/WzyrHlu5lKxhfynYztFxZPnFjE3jfLrVPzoUB+9dcXmyOSYj52RIsmJn40
         bsUg==
X-Forwarded-Encrypted: i=1; AFNElJ/VmpewoGY0NleOq/S9ayyDx6RW1bpLqHD4lRY7kqot6RouEP0cBK5QSy+OytoYP/qCm5Iwjt3QHuyuGQ==@lists.linux.dev
X-Gm-Message-State: AOJu0Ywio4iUZwr/vg/6WtS3eaqZvJGdYQ9D9lOwZN9vo6dJMT3p3L9h
	RLyitCEPC29QVDYTNXvZ/RRm7NX7TITLmF5nppoW6b2GrGYPdQ+050vDDearrbW1Zcs=
X-Gm-Gg: AfdE7cmViuT2grm702VulycMY3gp2S9QDA8uQhJNE2YAXd+PsLdx9Od5pSCFzDxd1Xh
	SabgiGTKFq77vFwNyAyWHGudTfHrpYmAGP9vvwEpvF6AhC9z9KvRAA88P8kBlLRoXLlOqLhRnLl
	CnODNf+HRhAqS85SbXCIf9FZ48V77Zr0vsr6BL73tDtMBXa2+FEGxkJFN7pbs/vSH9BYoYdEZfy
	ZSrcHMB9Kk50XzdwX30x5NFNJOSjKHCodtVwin2B2GcyPIuDt1d4Tzwz4aiMOWiqo0K8A91QSvA
	VRbk43TZ8fGCb1q+l9HrP9c5n0Brh42ApmxDSxjCgFDDTn0xmwNrkxMZ/51K8GIEjEg/6zMa5t8
	Jw2cLDXeWg2hEWtmRAwABbRv2S+wbWlLl/e7T8cq0RLH0XhNatHw6u9IssLHu0F3PNzhJGV/V8n
	Dtk7N8QpFgGHo=
X-Received: by 2002:a05:600c:5298:b0:493:8391:919a with SMTP id 5b1f17b1804b1-493b71ad007mr9854285e9.16.1782736948492;
        Mon, 29 Jun 2026 05:42:28 -0700 (PDT)
Received: from localhost ([2a01:e0a:3c5:5fb1:1d21:f5d5:2d3c:23a7])
        by smtp.gmail.com with UTF8SMTPSA id 5b1f17b1804b1-4926f94f213sm276368785e9.12.2026.06.29.05.42.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 29 Jun 2026 05:42:28 -0700 (PDT)
From: Jerome Brunet <jbrunet@baylibre.com>
Subject: [PATCH v2 0/6] clk: sun6i-rtc: Add support for Allwinner A733 SoC
Date: Mon, 29 Jun 2026 14:42:04 +0200
Message-Id: <20260629-a733-rtc-v2-0-7b72112784f8@baylibre.com>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAB1oQmoC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyjHQUlJIzE
 vPSU3UzU4B8JSMDI1NDIyMz3URzY2PdopJk3WRTQzPzlDRDk1SzVCWg8oKi1LTMCrBR0bG1tQB
 8LVc/WgAAAA==
X-Change-ID: 20251226-a733-rtc-c5167df14e6e
To: Junhui Liu <junhui.liu@pigmoral.tech>, 
 Alexandre Belloni <alexandre.belloni@bootlin.com>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Chen-Yu Tsai <wens@kernel.org>, 
 Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Samuel Holland <samuel@sholland.org>, 
 Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Maxime Ripard <mripard@kernel.org>
Cc: linux-rtc@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev, 
 linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org, 
 Jerome Brunet <jbrunet@baylibre.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=2252; i=jbrunet@baylibre.com;
 h=from:subject:message-id; bh=Jpxu3JhIRQUn0r/J9h/BIiZQMvK4hOfLEjUDM7I8VOM=;
 b=owEBbQKS/ZANAwAKAeb8Dxw38tqFAcsmYgBqQmgsLZoWjG/cvgZlCtaTSQlyh40bTtBK3tPuD
 /vjZphmkpCJAjMEAAEKAB0WIQT04VmuGPP1bV8btxvm/A8cN/LahQUCakJoLAAKCRDm/A8cN/La
 helPEACuIP0X9qjYFDqGAzbzDm7fgzSYec6JBjtuY8SIhaIYa+FNc9lGF1OgsEkoQzgfbdkOP7L
 zI+/prvEt2N7oqAaLUTLfEW6LGKu+bcrYgmFudS/f6O5MqMTUYzHm9/j36vQLvhydzF4f9Y1Pne
 mZZ8IoXTrAkhvwsa4JQhR0k2qI1wLA0yHyJY32k50Pfqvvr5UG8GDsWkCfLQABKIboBiolOpxQ8
 KTDpRZH/G145BUKyyagMGkeVJjIqHPGI97EieDJVkl4ozgdKCGPUbW9jKEkBbO8UXq5odYObgpx
 +g4ZNaU81kT23qb/G1MLK8wPSFSEVO3qP/JGIIrGMzbKcUrYISZHERVQmdnwuGDWetI0M9CdX2z
 g4Ls5cXglJRTatUUltpxUvfiJBP8UZiX/tPpfCsS1fXIWRRg2rsz3wHgegXmlO4YSkulE/8AgmT
 8jg8MIJ4I1EZj7OD7ZeVRrwCwpmEAC9ZanJpYpN7k4rgtjOcLgE5ns3gtuH2nKdi9s4LNzIPUqX
 FKIm/DC8C2DUEP7bUd+6P9M44r4sf31b/c61qZ3Tu+wqxYNjrCvJIdR6zl8bOuC1JRfKoyIHlwY
 YSpRwTACAPjGg8h7icf7N/6/xOe+3B4gBFtqLpqloNeIvlYEN6wkpek8vLlxSHunLzuaLec6hv5
 yTkIJm/l07vOsMA==
X-Developer-Key: i=jbrunet@baylibre.com; a=openpgp;
 fpr=F29F26CF27BAE1A9719AE6BDC3C92AAF3E60AED9

Add support for the Allwinner A733 RTC and its internal Clock Control
Unit (CCU). Reuse the rtc-sun6i rtc driver while introducing a new
SoC-specific RTC CCU driver to handle the hardware's evolved clock
structure.

The A733 implementation supports hardware detection of three external
crystal frequencies (19.2MHz, 24MHz and 26MHz), which is represented in
the driver via read-only divider operations. Implement logic to derive a
normalized 32kHz reference from these DCXO sources using fixed
pre-dividers. Additionally, provide several new DCXO gate clocks for
peripherals, including SerDes, HDMI, and UFS.

This was tested on a Raxda Cubie A7A.

Changes in v2:
* Changed DT bindings as suggested. Those have changed significantly
  since v1 so I did not pick up Rob's review trailer
* Support added in the existing RTC CCU driver rather than a separate driver
* Added DT parsing clean up of the existing driver
* Xtal detection exposed by RO divider rather than a MUX.
* Dropped conversion to aux device for now. This is not strictly related
  the a733 support and will submitted again later on.
* Link to v1: https://lore.kernel.org/r/20260121-a733-rtc-v1-0-d359437f23a7@pigmoral.tech

---
Jerome Brunet (5):
      dt-bindings: rtc: sun6i: add sun60i-a733 support
      clk: sunxi-ng: sun6i-rtc: clean up DT usage
      clk: sunxi-ng: div: add read-only operation support
      clk: sunxi-ng: sun6i-rtc: split main oscillator div and gate.
      clk: sunxi-ng: sun6i-rtc: add a733 support

Junhui Liu (1):
      clk: sunxi-ng: sun6i-rtc: Add feature bit for IOSC calibration

 .../bindings/rtc/allwinner,sun6i-a31-rtc.yaml      |   1 +
 drivers/clk/sunxi-ng/ccu-sun6i-rtc.c               | 124 +++++++++++++++------
 drivers/clk/sunxi-ng/ccu-sun6i-rtc.h               |   3 +-
 drivers/clk/sunxi-ng/ccu_common.h                  |   1 +
 drivers/clk/sunxi-ng/ccu_div.c                     |  11 ++
 drivers/clk/sunxi-ng/ccu_div.h                     |   1 +
 include/dt-bindings/clock/sun6i-rtc.h              |   4 +
 7 files changed, 109 insertions(+), 36 deletions(-)
---
base-commit: dc59e4fea9d83f03bad6bddf3fa2e52491777482
change-id: 20251226-a733-rtc-c5167df14e6e

Best regards,
--  
Jerome

