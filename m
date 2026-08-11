Received: from mail-oa1-f50.google.com (mail-oa1-f50.google.com [209.85.160.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 24B4442C50D
	for <linux-sunxi@lists.linux.dev>; Tue, 11 Aug 2026 23:11:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786489918; cv=none; b=cJKvLd8zLDT51JPStEP+IdLrKrT4GaiEoE8cATeU3Wg6k/4QEn6Gkp/Fwa4KfpEvVGcCZcgdEyjuv3htHw9EJ34+p8v3y5iNY0qC4851k1MYUmmRcnoL1l4ilKpPhCyBxfX5mm23xezqzLHvtn+OZxJ795tO17IOMa5JGoLGYRE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786489918; c=relaxed/simple;
	bh=m8Tk/LHTt7woozpDf5l5R8p0sPN48b3SSw63XUi+OO0=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=sBCacei/dunhp081oZMDVMrb6jjIlXUf5dIA6AWrWZh70zKIZkB5HLB0xs64PS7wCLLptCxpJJkNo6NAA3agqMdddoAK5TIvAIwgqPGBJB/ERXkYPNJXsNMqEYmBJpb2Xp2AW7YV4STytKpGAjmen0LYyiz5b+nuhTVcfuClDxE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=V6CbsRhQ; arc=none smtp.client-ip=209.85.160.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="V6CbsRhQ"
Received: by mail-oa1-f50.google.com with SMTP id 586e51a60fabf-43bf9548df4so214244fac.0
        for <linux-sunxi@lists.linux.dev>; Tue, 11 Aug 2026 16:11:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786489916; x=1787094716; darn=lists.linux.dev;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=VGtsPbK8GNJZaeKd8SPWh1xm+haf1/Y+LEIVzK/roP0=;
        b=V6CbsRhQS/HH7fesSS8Ma6PJz2T4UNDXUiAuloihBgvAkRB5YeF+QpfHsmYyRyctCn
         ggVaFW4ShNAIZBnRcQ7HvvRY5WTfSx2sebMRH69FpvCEeWnJv0PbQCTxSmGrBuz4Ip9Y
         4yO7puZaw05HMWpZt8wOKiNO3vJlXIx8MKrbXny/hNIaP9k+un+BaxHoOdlYCXXb1tz9
         zf1/hgtFlpI1wacobR1Kz/09uOrvWV/RNCPwuF4wgglU/6iYoIQHCBxeBPyQzM2yaY4B
         eeP1KHs9DFE3rR8nVri3mz2KHbtfHiv9MYEJbF6B4T0zZxBDxMpcXdovPxkRYPggK0VE
         6tBg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786489916; x=1787094716;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=VGtsPbK8GNJZaeKd8SPWh1xm+haf1/Y+LEIVzK/roP0=;
        b=iudtlGZN+LEJz78vZlxbbflry79esXaDHJ2pNS6OMl6Zp9QOO65IQ99VMVwNJLwN7J
         Mb26OGbYR4RTCtZ5x+l8v/NzTVtpy+K+WWFNRnkexjOb3aP6L1xOlq1rCwgewAjeUR8m
         7mAyGtYNuDkDCMxM/xKk2NGbjkVSFyrCgZ+iXL0v2viO4Oft1ptpoGou0dxzT6a766+F
         olH7U8JgjMJBRiq2OrmAHyGwT5Whu+M2tgd1VEw6tYKM8VqKwRalJs/ahhSt2WLo7OOI
         3nDFfe7LhEPOym1i7k7ULSG5TfVeJKkKWMICsG3cfdZ2r7VKfh2uDuYwMLb/t0bOyYXo
         LXHQ==
X-Forwarded-Encrypted: i=1; AHgh+RqpRMIDJv16bIYgjI+PQxQeH9wtTgcQFLOI5QfKu5W2iBpUwfd9oTh0A0QhEszV9NMz3XDqatI+DLz+YA==@lists.linux.dev
X-Gm-Message-State: AOJu0YxjE9dNV3zCYtHHZdwQvZ4dZ8/eh94Cn6prDs/zumijLxzmd4dh
	/lHPNRY7cAh6VoIyNvSFMZ4qcV9WpzbvwEAZaSz5ir4RNW7+But84Qa3
X-Gm-Gg: AR+sD104Uw0I7JYtfcxA4UQwOVqqHFp9URBVgazPcQr+wQekG3BbBNJp3i6EK44UrRu
	QADtx8qyncqrEvzdJfmieoyLVj2ZsjeBQKQ6ABY96cUEZJGfwoqMQQygJD074JMib6DbMBVN6jk
	djs02Oq+DlBKWONSytWGPaLwki4llgz5q3Ss24zwpOARvM3V/COiD2RVxEfGIF+k+5/yxfmE9Au
	QxLxYMjUOo9fAdJjYtdAzSHRy87G9B7R/eWF7m0C+eIpyVIXmZO2Q4dNYuFlCOO8gl3sxy4j19s
	aVBbVQb4CNDk+uenEjn3KZ0rG3oMHAwGVZh3txHGzH4c755Vo8ULcfe/wdYQFflowFHWm0qyHhx
	TQ+AGEykPmyWGSFayNNUR219XX4RpAzl11k5i/34VqQavK29crKGLXcQB8WEW8+ey90bCxPSr0W
	r147ZJykX/XRTnN5fFnh7I8yQgYaPFFkerOPGbj7Uwcx5vIDcrBPq7CYosBLev3tlHCR8YRKlvv
	WaqrXGxBlOrs1qVJqOe1kVM9SJZ+TC7w/ip/jvf0GGePU4ur9+bZQOtOBX/z0B9Ru0Mv2pu0f6M
	CzmShmzbLZEPl8tP7pUvHT/nuGCmaEzLTveblHEe5IwnGO9bVBwodKzx70VLZsSf+lOCvaOLT3W
	sPHQwfMn8BTIYkyZm
X-Received: by 2002:a05:6870:be96:b0:42c:49c7:a499 with SMTP id 586e51a60fabf-45e3e86ce4bmr460551fac.3.1786489915904;
        Tue, 11 Aug 2026 16:11:55 -0700 (PDT)
Received: from [127.0.1.1] (184-96-154-59.hlrn.qwest.net. [184.96.154.59])
        by smtp.gmail.com with ESMTPSA id 586e51a60fabf-45e3510fa5fsm713176fac.1.2026.08.11.16.11.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 11 Aug 2026 16:11:55 -0700 (PDT)
From: James Hilliard <james.hilliard1@gmail.com>
Subject: [PATCH v7 0/2] mfd: add X-Powers AC200 support
Date: Tue, 11 Aug 2026 17:11:29 -0600
Message-Id: <20260811-submit-ac200-mfd-v7-0-8b06f552a4d7@gmail.com>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/23OTQrCMBAF4KtI1o4kwdTUlfcQF/ltR0wrTQ0tp
 Xc3rYIKLh+8+d5MJLoOXSTHzUQ6lzBi2+Rw2G6IqVVTOUCbM+GUF1QyBvGhA/agDKcUgrcgtbK
 FpaXjUpB8du+cx2Elz5dXzjdXZ/rFWRo1xr7txnUziaX35mn54YfMtx7s2KiABhKDJICC9op5K
 ZjUXJ6qoPC2M20gy1Aqvqh/n6YiA0Zoxktu5L78AeZ5fgKuff8nDQEAAA==
X-Change-ID: 20260811-submit-ac200-mfd-8bad6d09e285
To: Lee Jones <lee@kernel.org>, Arnd Bergmann <arnd@arndb.de>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 James Hilliard <james.hilliard1@gmail.com>
Cc: Andrew Lunn <andrew@lunn.ch>, 
 "Jagielski, Jedrzej" <jedrzej.jagielski@intel.com>, 
 Andre Przywara <andre.przywara@arm.com>, Chen-Yu Tsai <wens@kernel.org>, 
 =?utf-8?q?Jernej_=C5=A0krabec?= <jernej.skrabec@gmail.com>, 
 linux-sunxi@lists.linux.dev, mfd@lists.linux.dev, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
X-Mailer: b4 0.15.2

This submission contains only the AC200 binding and I2C register provider
and is intended for the MFD tree. The Ethernet PHY binding and driver are
submitted separately to net-next. Neither series has a compile-time
dependency or required merge order. Their shared design point is the DT
representation: the MDIO PHY-package node references the separately
described AC200 I2C node for access to package-control registers.

The X-Powers AC200 is an I2C-controlled mixed-signal companion IC with a
paged register map shared by its audio, video, RTC and Fast Ethernet PHY
functions. Its shared input clock must remain enabled while the chip is in
use.

The provider enables and rate-locks that clock, matches the vendor
driver's 40 ms delay before the first register access, initializes the
paged regmap, reports the chip revision and applies common reset. The
regmap remains attached to the AC200 I2C device. A separately enumerated
function can resolve that device, establish its lifetime relationship and
retrieve the regmap through the generic device and regmap interfaces.

The two patches add the minimal AC200 binding and I2C register provider.
They do not add syscon registration or a private cross-subsystem API.

The AC200 work builds on earlier work by Jernej Skrabec and Andre
Przywara:

  https://github.com/jernejsk/linux-1/commits/ac200-v4

Public AC200 documentation is linked from:

  https://linux-sunxi.org/AC200

Validation completed for v7:

  - an x86_64 defconfig object build of the AC200 provider with W=1;
  - dt_binding_check for the AC200 schema; and
  - strict checkpatch checks with no errors and only the generic new-file
    MAINTAINERS prompts.

The provider initialization was hardware-tested on an H616 board, where
it reported AC200 revision 0x101 in package 1. The direct device/regmap
lookup used by the separately submitted PHY driver was previously tested
on the same hardware, including supplier unbind and rebind.

Assisted-by: Codex:gpt-5.6-sol
Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
Changes in v7:
- drop the managed external-syscon helper and AC200 syscon registration
- leave the regmap attached to the I2C provider for direct device lookup
- reduce the MFD series from three patches to two
- Link to v6: https://patch.msgid.link/20260811-submit-ac200-mfd-v6-0-c5b1292c8498@gmail.com

Changes in v6:
- split the MFD work from the independently mergeable networking series
- put the merge routing and shared DT design at the start of the cover letter
- rebase onto the current MFD for-mfd-next branch
- Link to v5: https://patch.msgid.link/20260809-submit-acx00-of-dynamic-v1-v5-0-bfa1f8518b28@gmail.com

To: Lee Jones <lee@kernel.org>
To: Rob Herring <robh@kernel.org>
To: Krzysztof Kozlowski <krzk+dt@kernel.org>
To: Conor Dooley <conor+dt@kernel.org>
To: James Hilliard <james.hilliard1@gmail.com>
Cc: Andrew Lunn <andrew@lunn.ch>
Cc: "Jagielski, Jedrzej" <jedrzej.jagielski@intel.com>
Cc: Andre Przywara <andre.przywara@arm.com>
Cc: Chen-Yu Tsai <wens@kernel.org>
Cc: Jernej Škrabec <jernej.skrabec@gmail.com>
Cc: linux-sunxi@lists.linux.dev
Cc: mfd@lists.linux.dev
Cc: devicetree@vger.kernel.org
Cc: linux-kernel@vger.kernel.org

---
James Hilliard (2):
      dt-bindings: mfd: x-powers: Add AC200
      mfd: ac200: Add X-Powers AC200 support

 .../devicetree/bindings/mfd/x-powers,ac200.yaml    |  49 +++++++
 drivers/mfd/Kconfig                                |  11 ++
 drivers/mfd/Makefile                               |   1 +
 drivers/mfd/ac200.c                                | 163 +++++++++++++++++++++
 4 files changed, 224 insertions(+)
---
base-commit: ffc63a677b60247738b02a2520c6bfa740523c2b
change-id: 20260811-submit-ac200-mfd-8bad6d09e285

Best regards,
--  
James Hilliard <james.hilliard1@gmail.com>

