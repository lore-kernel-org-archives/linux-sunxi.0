Received: from mail-qv1-f42.google.com (mail-qv1-f42.google.com [209.85.219.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E7059346E57
	for <linux-sunxi@lists.linux.dev>; Wed,  4 Mar 2026 03:44:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772595851; cv=none; b=fL3nzU13jLqFz+xoWIOdIlV/IA0n1ZZqdS83iO0Hq9uUbssdWwPIizNRvwfddHIaKeuCxNechAbTTSTiFSekXYa7iP8Wk+UGNwQDHEYZUKY0/jz39OLyW/eTX0RU8PuwOztldQJGWolaXUrjil5SHlNYwGmwtiI2rPjbM9cHrkQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772595851; c=relaxed/simple;
	bh=97IdsNQD0Rvl8zYfDuEsgyoRn/f/Y8Pl2UCDFUdnpBA=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=Si84b3lQyb43LdLH08SzLFo27rD0Plk9NIWWqPuFMrN3QAkdtIS3D54+MSgBNh8CwnGk2ev0AD9zkv2FGL984ez9duNg79M5E1hKTDEI5U5MI/VXJUwxTMJ0a3kmFL/5FX71em2XEKVU18Ko8quqM4a/ZEIIkNYNXnmiu/ZKDmU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=hVVdWe6Q; arc=none smtp.client-ip=209.85.219.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="hVVdWe6Q"
Received: by mail-qv1-f42.google.com with SMTP id 6a1803df08f44-899fc9853b7so36551826d6.2
        for <linux-sunxi@lists.linux.dev>; Tue, 03 Mar 2026 19:44:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1772595849; x=1773200649; darn=lists.linux.dev;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=+UX3cCFsEn7IKh2oIgy8th+LH6QgE2NnzyAhbtsRwgI=;
        b=hVVdWe6Qifbc7Njj5PRGjjqXNbHVxB9dQU573Vv4IGyNsOvuxt+FkqVttwoXiHnlha
         bgYxFZKf9mAETjuc5Re4gW83epJmp8QecIyShtRq1fVTZ0eE3AUuZ+HtG1DXTH6P3985
         roFyChqSSsBqBTqhLrBthnG6e89R3+VrwG5xPAijNHENQuetA+ubJtB6S4w5R9ddnqj/
         EIejlZ48tSVyb6gERJaUAmBxakSdwWEl4R1SB74zxl0VfOpzSYxQv0C0okNruIIy5tOS
         o1nbBNiffUlokfW5s1i+PiKivTcUiP+L6x8/jggt5f0oj2VMZreuZhuAEvHCFbuc41wp
         E32Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772595849; x=1773200649;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=+UX3cCFsEn7IKh2oIgy8th+LH6QgE2NnzyAhbtsRwgI=;
        b=LdlHKcHWN9m6+7DNydyZJEP+Mj5O5sJjmjp6LiX2+9AWvUHkPV4NIyecDpjywHCvsv
         kU/EJmVE8C31bOljtuN0kzZJiovkXFFY+9uZtJ0iPSxz1NO9Sv8N82xrU0lvjMb8HRRv
         Dt4P0B2ZUbF6lXBEKC4+pb3dUUOYlE/GTDAPCQMPG0drVOE/4wObWW0KAcmJMB8gNGme
         axOZwfEk1EeJMeyr9WIXL9e3W21Z8PTBEBroMcfCZoIBtcBJcRDDM2y8eK15mjSJu/R4
         nj2VguULrPL+MKfuCDkelFLDzwz0Dbl/ul7EO73m9GD+puvTVwdwwniOoC4sW9ZMtq8D
         efaw==
X-Forwarded-Encrypted: i=1; AJvYcCWm1ZWjb3afrAJ269zYXOLqyOVkvXV2V7WRM/+KNFW39B8hreDSnNBREDlzVV2GNwS/zBIP9lA1bP9NxA==@lists.linux.dev
X-Gm-Message-State: AOJu0YzXW7mIeO7GDVbaHPPyPeR3Q803NCv88yNTZj88QtLSvL8KHrmY
	VxJ/VCOmAvM7+BCZPGYzfMqP/qHkphj/8mYCBVdQHJb7JeZHFuxMBhl4tVx6rL+C
X-Gm-Gg: ATEYQzxtbDT0JdQXS/+HMZ6uSF5/zRN3h98cxYrKWM52LS0o5Ap9ATVCGOG2I3S3rt6
	BvzAfKTmo/KmwTT/FhQXEVOmmt+7X065RGpcxS8XuOEwDaAqVMu/P7SYXje/irfFpgRc4qdS5GX
	Jqkne1llZqRUmwgMfaAlBCTwKNTnpTR0v735UgiOlwwYbc8F8+6cm1s7/9Hy/Lqt3wPbhzlnkxg
	RbCVaSsHMyDqvj7Xvk+P6WbkNS8Axi8CipYixI92MIgrpVcz6auXxkdkXTPcNXngU3xDVX9k/6z
	ahaTVp1QxNebcI0f/PZqU/5y0BNmcB7ih9xFKEiGzS6POSdI70posNBnIx2tYJ9mXdRU04pFmrn
	xJJKLi2KG2yyjWFHtdPqkOva8ghjpxBrAdsZQVb71AhkrUJW5o1RgewzCo+dmd/x8PAp3mmpRy7
	IYcOVk2hFnSuWPDkFZMKbVjpzcRMU/0uct0tn19g==
X-Received: by 2002:a05:6214:1d06:b0:89a:ec6:101f with SMTP id 6a1803df08f44-89a1998c1e7mr7800326d6.1.1772595848813;
        Tue, 03 Mar 2026 19:44:08 -0800 (PST)
Received: from [172.17.0.2] ([134.128.219.200])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-899e608cfc6sm88603286d6.14.2026.03.03.19.44.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Mar 2026 19:44:08 -0800 (PST)
From: Yuanshen Cao <alex.caoys@gmail.com>
Subject: [PATCH 0/2] allwinner: a733: Add A733 PCK600 Power Domain
 Controller Support
Date: Wed, 04 Mar 2026 03:43:43 +0000
Message-Id: <20260304-b4-pck600-a733-v1-0-2f54efdb8cc2@gmail.com>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAG+qp2kC/x3MQQqAIBBA0avIrBuYUrS6SrSonGoIShQikO6et
 HyL/zMkjsIJepUh8i1JrrOgrhQs+3RujOKLoaHGkiaDs8GwHJYIJ6c11q4jJjatNx2UKERe5fm
 Hw/i+Hwha8cxgAAAA
X-Change-ID: 20260304-b4-pck600-a733-1790e0e48d49
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Chen-Yu Tsai <wens@kernel.org>, 
 Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Samuel Holland <samuel@sholland.org>, Ulf Hansson <ulf.hansson@linaro.org>
Cc: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-sunxi@lists.linux.dev, linux-kernel@vger.kernel.org, 
 linux-pm@vger.kernel.org, Yuanshen Cao <alex.caoys@gmail.com>
X-Mailer: b4 0.14.3

Hi everyone,

This series is to introduce Allwinner A733 PCK600 Power Domain
Controller.

Allwinner A733 has this one power domain controller, PCK600, which
shares the same BSP drivers according to the package provided by 
Radxa[1]. Unlike A523, A733 does not require the resets. Apart 
from that, driver wise, everything else is the same. 

Add support for A733 power domain controller by making resets optional
on sun55i-pck600 driver, adding A733 sunxi_pck600_desc and dt-bindings 
definitions.
Tested on Radxa Cubie A7Z.

[1] https://github.com/radxa/allwinner-bsp

Signed-off-by: Yuanshen Cao <alex.caoys@gmail.com>
---
Yuanshen Cao (2):
      dt-bindings: power: Add Support for Allwinner A733 PCK600 Power Domain Controller
      pmdomain: sunxi: Add support for A733 to Allwinner PCK600 driver

 .../bindings/power/allwinner,sun20i-d1-ppu.yaml    | 17 ++++++-
 drivers/pmdomain/sunxi/sun55i-pck600.c             | 53 ++++++++++++++++++++--
 .../power/allwinner,sun60i-a733-pck-600.h          | 18 ++++++++
 3 files changed, 82 insertions(+), 6 deletions(-)
---
base-commit: 0031c06807cfa8aa51a759ff8aa09e1aa48149af
change-id: 20260304-b4-pck600-a733-1790e0e48d49

Best regards,
-- 
Yuanshen Cao <alex.caoys@gmail.com>

