Received: from mail-oi1-f177.google.com (mail-oi1-f177.google.com [209.85.167.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5A43C384CE5
	for <linux-sunxi@lists.linux.dev>; Fri,  4 Sep 2026 21:23:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788557020; cv=none; b=dU6tK4QEiYJWHZs72/dVFUDUuhHA3dJod3ViMjQzahUiR3dPRGwctX6HA+C+7plOSUdy5zA6FWw+Zl6XPTxaBVeG2F6m7iR9gxmXCSBensOVl2cKtVOYEid0i44zFBcfm/jl7vDWvGZxv7P1tm0+wX4bqyAOsNILUUVSSShcmHA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788557020; c=relaxed/simple;
	bh=TnmhAN7UAS2ynuFEOPQLlzD2wvbIo/yeVWwhOMqNS58=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=dKWEzntd1miUn8ZRvhwEqDwpULsYmxM7VahP5mq0zQYxFBYnJjsQczgBlFiKtSHHxyN2KzojzsON2qQBc6KSEF86pNN/fq03jF/j4om6aCLehOj1QhmHFfhRClJ4q6WiugJ8K1KgeKdbuUYVM1hMtASSlVSB9l1EFy/M/xVgAD8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=F/s1K5wo; arc=none smtp.client-ip=209.85.167.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="F/s1K5wo"
Received: by mail-oi1-f177.google.com with SMTP id 5614622812f47-4b1ba286f6bso1951013b6e.1
        for <linux-sunxi@lists.linux.dev>; Fri, 04 Sep 2026 14:23:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788557016; x=1789161816; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=SP5FgDVql885MI97WgCQyPWKLiok3M5jguE0MrKj3qI=;
        b=F/s1K5woJ8a2BJZVgm8owSu5QVMHW6Y3eySih6yh0vyWBA8KrKuleqbQTcKcjvOhpO
         lCRdaZKd0W41B9KXjztoAiO5AlFIP+5J3i9uMSDJ1zwHsPEnviqxDxSniVEN2DcG6DKm
         Yu1n9O+JaH5c+ocFwWW+RTNKdbyxbrXOnRe0JIQHBp5RJz+qVjc36DLEW871Id9WsKdC
         CVvzWLK9xR22DFF9wFOyePVcur+62/RVgxaThYJNgvWdJ8r2tXAIr73zcFTpJQFhWgdY
         vsutQ0+j9T2baz6hu7fwdzXUCC1hzh7bdrRU86BsvrC4RH61qpd8VaLOB7bhYHcY30dR
         Ujtw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788557016; x=1789161816;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=SP5FgDVql885MI97WgCQyPWKLiok3M5jguE0MrKj3qI=;
        b=dCl4h4FT8O47U0+upzOvKuUe3AesWhvmg/MXxwPuEUzudqqs9suFhn7LZ72gWOyX7g
         7FUWpz9VRoqdfStUKi4K+Uy6P/CmlaR4CcE3AtYD2p0r1krzMAW/UveOa0Z/Ma59RI+j
         pybIgIREd6N1gw4aEL1t7dEihtynmPg6XgiVIN+LxVj4JFvNLT9FlzxttgAAcxmscIyr
         m0uZgM4NtLLGl3TjrkfVSaHhTK+jOJpB//5tPO2tSoeu9JX2Ns0hn7N47e3vtYirxxuE
         gvdbPdXZPpggC/+T/qqKeY9L3TPrE4DuYYGOsXrgYe6gCuBfmtsnwzr9z2aetyNaHAME
         0L3g==
X-Forwarded-Encrypted: i=1; AKwUvBxzkGrV5eYKAil8R09BvOErfOFYA4yBpvo9Fuv+R0Y+fZr0w3eQnop2g0ezNvSsitBozSBL2l2SyCHnJg==@lists.linux.dev
X-Gm-Message-State: AFuF++nRLegY73ZI5wph08JD+MtHxVyhBSSuAkDTGylMzkdHTSCK4AT5
	mpTBg5wLrZzc2peu01dvDwKkf0UDpPEPSByXMarZugDDZaidqzVVm2WbN2yQ8w==
X-Gm-Gg: AYBFou2hRccMM82D2w9jqJ6qh4+w2/4R47DT30gdgQEp0vZNKxI69IUwLz9WB7tLeVP
	pjX422TTgq9GeJM0zXferMUwB3sPajdWvP7XxrU/SBHTEZDPnu9TQ6/vDbWbXr8C7zp9eD1SZuC
	aPwVMUA21eXwe6FJ6yuFdkjFY6YwQJbZp10vA8wjmcy0WFSrjTVDww4lFqbNYBKjOO1yJ/T+hnN
	+r7oP3bRbJ5++Ini1/8NdJA/0TZDPvjS/thAeIU/mhmf7F7zPV40oJ0w/IheJYH8HyFUxe5gNca
	v0c8lgxS5cOCY5MlOirgkLrdxkRCJRqd33qsLwNotg3DQEwKhB2NbhtTwnc3J8cDdlI8gvveG5T
	VuVz/JYQC8ADcmWcXhjGmLvBX0323lvKnZhDe1owooOSeCeLSf/HSV93jCevBuI96JckFKB9cWX
	K6GWrQzy4X3x4mD6oCc3LCtQ5Bk0NKu0lii+aRi+iajhgOf1KI0PIGHsIZ7EOeWKEG+lYnAC1oJ
	INe1crOOsGrk5Quzw6931FeN9LsSNAXbZ9Ru/24AeIeYNVQM9DhjcMWVNxHOYxj1xd++R+VqcHM
	9rnuRM+MFkuWa1cDtfoyerESN9ckzsiz2HQCUL7XnTf7U5ftxge42+qVqdtQbkAj66PrVMcsK3p
	q8x8nmwLNrP27OG6bW1U=
X-Received: by 2002:a05:6820:1521:b0:6b5:ec3f:4983 with SMTP id 006d021491bc7-6b71ff594bfmr2962915eaf.30.1788557016267;
        Fri, 04 Sep 2026 14:23:36 -0700 (PDT)
Received: from [127.0.1.1] (184-96-151-165.hlrn.qwest.net. [184.96.151.165])
        by smtp.gmail.com with ESMTPSA id 006d021491bc7-6b6dbedc6fasm4492259eaf.3.2026.09.04.14.23.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 04 Sep 2026 14:23:35 -0700 (PDT)
From: James Hilliard <james.hilliard1@gmail.com>
Date: Fri, 04 Sep 2026 15:22:11 -0600
Subject: [PATCH v2 1/3] dt-bindings: mtd: sunxi: Add randomized OOB flag
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260904-submit-sunxi-nand-vendor-oob-layout-v1-v2-1-b12074f4aca7@gmail.com>
References: <20260904-submit-sunxi-nand-vendor-oob-layout-v1-v2-0-b12074f4aca7@gmail.com>
In-Reply-To: <20260904-submit-sunxi-nand-vendor-oob-layout-v1-v2-0-b12074f4aca7@gmail.com>
To: Miquel Raynal <miquel.raynal@bootlin.com>, 
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Chen-Yu Tsai <wens@kernel.org>, 
 Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Samuel Holland <samuel@sholland.org>, Maxime Ripard <mripard@kernel.org>
Cc: linux-mtd@lists.infradead.org, devicetree@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev, 
 linux-kernel@vger.kernel.org, James Hilliard <james.hilliard1@gmail.com>
X-Mailer: b4 0.15.2

Allwinner NAND firmware stores the bad block marker through the
controller randomizer. The mainline driver instead compensates the first
two randomized bytes so that the marker remains plain on flash.

On H6 and H616, the firmware also uses a fixed protected user-data
placement while mainline fills the OOB space left after ECC. Add an
opt-in property selecting the firmware's normal-page format for the
configured controller hardware-ECC geometry. This covers the
vendor-specific randomizer, bad block marker representation and protected
user-data placement needed to access BSP-derived images.

The property does not change raw-access semantics. Raw operations still
bypass ECC and randomization and expose physical main and OOB bytes.

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 .../devicetree/bindings/mtd/allwinner,sun4i-a10-nand.yaml      | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/Documentation/devicetree/bindings/mtd/allwinner,sun4i-a10-nand.yaml b/Documentation/devicetree/bindings/mtd/allwinner,sun4i-a10-nand.yaml
index 9d061e2216cb..8ecafc40ddcb 100644
--- a/Documentation/devicetree/bindings/mtd/allwinner,sun4i-a10-nand.yaml
+++ b/Documentation/devicetree/bindings/mtd/allwinner,sun4i-a10-nand.yaml
@@ -79,6 +79,16 @@ patternProperties:
           minimum: 0
           maximum: 1
 
+      allwinner,randomized-oob:
+        type: boolean
+        description:
+          Select the normal-page format used by Allwinner NAND firmware for
+          the configured controller hardware-ECC geometry. Normal page
+          transfers use the controller randomizer, the bad block marker remains
+          in its data stream instead of being compensated to stay plain on
+          flash, and protected user data uses the controller-specific placement
+          expected by the firmware.
+
     unevaluatedProperties: false
 
 required:

-- 
2.53.0

