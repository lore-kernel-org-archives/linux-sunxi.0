Received: from mail-oi2-f13.google.com (mail-oi2-f13.google.com [74.125.231.205])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B167A4C67F0
	for <linux-sunxi@lists.linux.dev>; Tue, 15 Sep 2026 19:03:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.231.205
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789499016; cv=none; b=Q9EPttxbc7Jz7XS1P3hF6Hv8lfAjKWsMtrHxW8pK36Yd3d7AbswltwSePAO0OwtZWQM/LZBYyPvt/1Ay2qynSe4EP9pNfXH8hQRJxuPP5QDlObWk7a+MPWff+iUDUvLkkUS6ZBbA/Zwno+TsXSyXhGFOggXpS3V3xjqen0dBCBY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789499016; c=relaxed/simple;
	bh=4nxtyyqEl3KNqFM/VNPCt8/lxZqhenmbkWEsMZt3P7E=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=QQcQRa/vf2nT9TwnQv6w3+MlwtfZWCusvnTIViq1JyHn9dNVHnXqOCWhbJfin2ks58vCRj3FiXWO4D2uxDhi3dnm+GAUK/vJdXxq8Iafs9VtVWnw/MO7xUe4k37+1vP9Yt5o7k2Xq0b3cSuGmDODOBkWvQx7pFEwGdVwVnbR2bU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=srMnHIgH; arc=none smtp.client-ip=74.125.231.205
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="srMnHIgH"
Received: by mail-oi2-f13.google.com with SMTP id 5614622812f47-4b37a3ed714so163567b6e.0
        for <linux-sunxi@lists.linux.dev>; Tue, 15 Sep 2026 12:03:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789499013; x=1790103813; darn=lists.linux.dev;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=6m+jC2rp2azBWtBItSkEbw2wCnf8fSU8Zkxe0cev4G8=;
        b=srMnHIgHGf/sfQU8Y5tUAxsP3QxOM6P9IDWJ+e9wlAOz9nIYmzG3qnWtwPiWTJvU7M
         VbXVBEpfeULcM1W7K296eVqdecB6fSZrIDTV/v3dtxcDW6EaTB8qfFY43w8NAnjov6Yn
         DT1S8jWUjfEiEQq//7wkMsEqPtRw017fEuSMSHj/JM89sbJW4CRfxFQTVI1SPD2IIYVB
         gIWBxnJAkUnhh9vc/665EWhBCmR/E3NxgKcPxGsEakod/V9VNQ3kC8IqABc3ehYgXhfq
         4xHCDt2PrR6g4bdDubpLbYcQ7dUIqsyxJNZ69X8nwscVRkyjSPAnqHPcw5d0/y95oqkN
         Rr+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789499013; x=1790103813;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=6m+jC2rp2azBWtBItSkEbw2wCnf8fSU8Zkxe0cev4G8=;
        b=I6Z8T27ZI4iJ0bJCw4rtoQDiga3mE7MJYVzerWqKVYmhFFrEms7eey1fdtMLJ5rvLE
         UT/TqMRSSRnp99xk02ZJHVd+qN/yjO9z++pa9vFFSbwZK7/uDgWmkgs66EkCHQH7aymz
         Y4WSZivJyxJNF4oDBRY2rDhLz8YOxnjLXP6aSpPy1YGcr4ezcCvWhNXJZrELtUvGEoBv
         M2rOjjdrFFq5HDmpj7pVdbXQRajdW0vDEZvXn/5J0BJY2gc5qw15629iaeqK3Bi0Psrz
         5lMsrJE0Lj3QNEANFwvmdLAuqb9lsjDZtxtoOI4VgBi4prG8OjcbjpzjEC+lidKRK6Jz
         Sfog==
X-Forwarded-Encrypted: i=1; AKwUvBzQprdjWZ8XWr89Mk5b4Xf/MuvtzvO56BhEl5kHbXs8DO2baSC07z4iIMJu7vJpkxlCsknzNHr75aAzQA==@lists.linux.dev
X-Gm-Message-State: AFuF++mNbK5WlqZTbkfFaOpf5zDGa7qFxEkEHrBCik1CGqbeS7kuB6QX
	DD81A2i2OGYT6wY5/KEkH68gvb2Ad1A0bXCQhFYlaGuvMOPqLvVNiqSG
X-Gm-Gg: AYBFou0BCjCsQSdY2Cv7C3ZriaSj9sOIkQPk3YF0GnovK7I9goNmbu7QQJovjoSOnMH
	D6fDqE2/YuPEhjinpSOd+aAph6si9zfHhcEexxTpkRVbkGzrL1sDO/vXiHac16lvh1zWuskR5+w
	PqbjqcSz+KN/FYRQxpcbl6n8zcXWmXVgqu+/0ZnzcO8BvO2JSCTmesoqnKM7vOVxfd7HBnvXQFP
	5oqXdACxzMZE3xL/QstxLe1ZCPEi+3msTYDxjhoHOdtMv2FZOG9hynFQAHVrPrGlkkTFHkzcYQ5
	j8tuGmJWqy8q1bVOiOVJyzp0l6YnbSPQ+BmRGC14bECxjCzkbeUtiRMu2DmHybJFN0WS9l8ST2k
	OkZvnYZN82NfokJ9Xje9acHetu/ymhHkr/3yN/pFenZrvkNyj34PuShkFVknQ5cIQmkV2mLgejs
	S4CuzSKIBrmUwHhPWV7jRBP+am7uDyXGZZFIK7e84I/cA9t01R++dz9Y81HgxHimQdZCTgOmfqQ
	JevmfJICHBvHKY46qukl0cysiuck3k7rlI2gQJAxNUUuNKQQirIu3shq/TuPUI5sRXCqm6/WRcP
	ZltPYRpy3kIxjNZWWKFMAyUl2uLU7/x3PV3p++D1qv6iR6cA7f/ohVVae9kUW4YbmZR3iHcTPob
	BkKgOQCub6u+qR3uxy31rkQ==
X-Received: by 2002:a05:6808:1929:b0:4c1:f40e:b697 with SMTP id 5614622812f47-4c7b61758c4mr7115389b6e.38.1789499013397;
        Tue, 15 Sep 2026 12:03:33 -0700 (PDT)
Received: from [127.0.1.1] (174-29-1-49.hlrn.qwest.net. [174.29.1.49])
        by smtp.gmail.com with ESMTPSA id 586e51a60fabf-4842546a51bsm836569fac.0.2026.09.15.12.03.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 15 Sep 2026 12:03:32 -0700 (PDT)
From: James Hilliard <james.hilliard1@gmail.com>
Subject: [PATCH net-next 0/2] net: stmmac: add Allwinner H616 EMAC1 support
Date: Tue, 15 Sep 2026 13:03:17 -0600
Message-Id: <20260915-submit-h616-emac1-v1-v1-0-195de0bb1f8a@gmail.com>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/yXMywqDMBCF4VeRWXcgE0N6eZXSRZKOOgVjSVIRx
 Hdv1OXP4XwrZE7CGR7NColnyTLFGnRpIAwu9ozyrg1aaavuZDD//CgFB0sWeXSBcCYk015VezP
 aeQ/1+k3cyXKwT4hcMPJS4HUuVfhwKLsK2/YHmuTXGoIAAAA=
X-Change-ID: 20260914-submit-h616-emac1-v1-143703842abb
To: Richard Genoud <richard.genoud@bootlin.com>, 
 Andrew Lunn <andrew+netdev@lunn.ch>, 
 "David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, 
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Chen-Yu Tsai <wens@kernel.org>, 
 Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Samuel Holland <samuel@sholland.org>, 
 Alexandre Torgue <alexandre.torgue@foss.st.com>, 
 Giuseppe Cavallaro <peppe.cavallaro@st.com>, 
 Jose Abreu <joabreu@synopsys.com>, 
 Maxime Chevallier <maxime.chevallier@bootlin.com>, 
 Maxime Coquelin <mcoquelin.stm32@gmail.com>
Cc: Maxime Ripard <mripard@kernel.org>, netdev@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-sunxi@lists.linux.dev, linux-kernel@vger.kernel.org, 
 linux-stm32@st-md-mailman.stormreply.com, 
 James Hilliard <james.hilliard1@gmail.com>
X-Mailer: b4 0.15.2

The H616 secondary EMAC supports RMII at 10/100 Mbps and uses a separate
system-control clock register at offset 0x34. Add its binding and a
sun8i stmmac variant using that register. A distinct compatible without
an older fallback prevents the driver from using EMAC0's clock register.

The PHY commonly connected to EMAC1 is in an AC200 or AC300 companion
package, not the H616 die. Leave its initialization to the PHY driver
instead of using the H3 internal-PHY controls. Retain the supported TX
and RX delay settings through the shared syscon setup.

The AC200/AC300 EPHY driver and package bindings are already in
net-next. This series separates the H616 EMAC1 MAC driver and binding
support from the earlier combined series. PWM, MFD and device-tree
enablement are being handled separately.

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
James Hilliard (2):
      dt-bindings: net: allwinner: add H616 EMAC1
      net: stmmac: sun8i: add support for Allwinner H616 EMAC1

 .../bindings/net/allwinner,sun8i-a83t-emac.yaml     | 18 ++++++++++++++++--
 .../devicetree/bindings/net/snps,dwmac.yaml         |  2 ++
 drivers/net/ethernet/stmicro/stmmac/dwmac-sun8i.c   | 21 +++++++++++++++++++++
 3 files changed, 39 insertions(+), 2 deletions(-)
---
base-commit: b8e9e7d82e7eefd5d2d528469d94ec20e96b38c3
change-id: 20260914-submit-h616-emac1-v1-143703842abb

Best regards,
--  
James Hilliard <james.hilliard1@gmail.com>

