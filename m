Received: from mail-pf1-f170.google.com (mail-pf1-f170.google.com [209.85.210.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 291571649BE
	for <linux-sunxi@lists.linux.dev>; Fri, 31 May 2024 14:12:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717164750; cv=none; b=Jzz/Nbx3pJTV6ZED0q7rCzRbow/3z/khxwBx3tPTdeGKEU+cARDvAbiwfCOCT4jSuhO77GXelS0bCc/01ouxazQG+tBk8b7sgaBkNNXzHr4veyFqOOcWGIFyWZPGqEKKZ6UgryiYPh2VBXS4Wr+sk6Tqa573i3HTV8THUxD6wVE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717164750; c=relaxed/simple;
	bh=ySGb1Jm4zAUSkNVL5xRbODLWUdyI4QAA3rXBMbD71cU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=UDtim/XcP9GfRN6Lyxqr2Q0fpijWV9ZR7Q0G0MXkw+YaTWZxeE4iT2jt8PXeBb9L1eQzRkVDQvuvi5dfjT9gWy0RByTeVKeqBuFWJKvJwrpqRZ5czV5rlxfZ8QxcRA+KbalrSFucVXGSHoD1mzuSmAAcCpIv1Szyt1qdYtyrXHQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=TpKfTXV8; arc=none smtp.client-ip=209.85.210.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="TpKfTXV8"
Received: by mail-pf1-f170.google.com with SMTP id d2e1a72fcca58-7023b6d810bso1228398b3a.3
        for <linux-sunxi@lists.linux.dev>; Fri, 31 May 2024 07:12:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1717164748; x=1717769548; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=CPJfZzAlshx5ECsaUbb27JTh2zfd8fB5yh8nTmdx9Ew=;
        b=TpKfTXV8aOc4TBbFfAbixnAXWfHXVnWLsMhaqSCMnhEMtEb1bJJ3ZC/MyILxc6mgkR
         8s/BY7/OJqd53C4Rm3UYSvkgF+3snS0NJXJed70zR3INzyD8/jWjQl471MpEjLq0eEce
         TVDVzVRQQOoEnvu0+tSJDXUAlGMSwLT8EbwkIyEhZjpJLlhCM6fILcMrehDJPOJqlZ+D
         LXripuA1nYQ1HzAKR/TUjvRVjtyD4A4U3bL27XYAwJ1eAHKPGcUNrd40xWcp283Q5GHB
         ri+2MTKWWh3YR/6SPU0uKg7LvSyLNvMtm6cRGueeo6NTM+Ct5GwlHq6MJ4lseZbXJr67
         LnTQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1717164748; x=1717769548;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=CPJfZzAlshx5ECsaUbb27JTh2zfd8fB5yh8nTmdx9Ew=;
        b=wIqAVJ02cygpN9MpCa/U0H1ACFrQicj3gslzPXtn7l/eUSAHs+yTS3WMxNqxjjZwRA
         OAmPRZ/PndrhL0p6fycsKp6VriAq4HHAVKf90sUEDXiySKPZPGk+7OZxGwv9sFJ6cnqK
         bExwOFNDZBKDpeyD7Xtdk86eWyTPlYV56cU4ELyjZu2twzk7TBbjvwqTKKu2khPlpyQ5
         o4Sy37N1w+8KELRP/EGKha/PRXzWII9XKlxWWOg3rqJakj5y1Q9ViHou/+eomJS8lnOx
         VZ6ruwxsfpGWv80VY5Uot6Fh7wI/I/NMLSRoJlLheXItOJcLSICVJhrf/a7JrqSkaaB1
         sRhA==
X-Forwarded-Encrypted: i=1; AJvYcCUZ5UiMWr0yfdXUkgtcjtQqkfk/0StyMdUfuZTiGHKVGaSNFeSY3NDsD926yheIFbw5Q8+f1hCNEpIFYKidUhtm5wR4t0iyW6tm/Zk=
X-Gm-Message-State: AOJu0YzfEf8HBZwJS6rKzkW6F2SQrpqtD8QAhsTDAd8S2chjT8H30kKO
	7ZN4V98opToEDiDCDS0ZWmwrEFrmQ/Sgzdpbqu53+d0eDnq2AmjkHsU3bEklHTg=
X-Google-Smtp-Source: AGHT+IFUfZFrkaT77WlxLeA/cfEsI2cTENqqh2ey9z8VUL3vIVSJO76NvoXO2i0KDDceR47Z029OGA==
X-Received: by 2002:a05:6a00:244d:b0:6f4:43d7:6bdc with SMTP id d2e1a72fcca58-702478c6fbcmr2196315b3a.31.1717164748356;
        Fri, 31 May 2024 07:12:28 -0700 (PDT)
Received: from noel.flets-west.jp ([2405:6586:4480:a10:167:9818:d778:5c14])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-70242b057besm1418103b3a.162.2024.05.31.07.12.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 31 May 2024 07:12:28 -0700 (PDT)
From: Hironori KIKUCHI <kikuchan98@gmail.com>
To: linux-kernel@vger.kernel.org
Cc: Hironori KIKUCHI <kikuchan98@gmail.com>,
	=?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <ukleinek@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Chen-Yu Tsai <wens@csie.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Samuel Holland <samuel@sholland.org>,
	Aleksandr Shubin <privatesub2@gmail.com>,
	Cheo Fusi <fusibrandon13@gmail.com>,
	linux-pwm@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-sunxi@lists.linux.dev
Subject: [PATCH 3/5] dt-bindings: pwm: sun20i: Add compatible string for Allwinner H616 PWM
Date: Fri, 31 May 2024 23:11:35 +0900
Message-ID: <20240531141152.327592-4-kikuchan98@gmail.com>
X-Mailer: git-send-email 2.45.1
In-Reply-To: <20240531141152.327592-1-kikuchan98@gmail.com>
References: <20240531141152.327592-1-kikuchan98@gmail.com>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Allwinner H616 SoC has a PWM controller similar to the one
in the D1, which is supported by the pwm-sun20i driver.

The main difference is in the register layout. Specifically, the
GATING flag is placed in the PCCR register instead of the
individual PCGR register.

Add a compatible string to distinguish them.

Signed-off-by: Hironori KIKUCHI <kikuchan98@gmail.com>
---
 Documentation/devicetree/bindings/pwm/allwinner,sun20i-pwm.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/pwm/allwinner,sun20i-pwm.yaml b/Documentation/devicetree/bindings/pwm/allwinner,sun20i-pwm.yaml
index 89cebf7841a..b9b6d7e7c87 100644
--- a/Documentation/devicetree/bindings/pwm/allwinner,sun20i-pwm.yaml
+++ b/Documentation/devicetree/bindings/pwm/allwinner,sun20i-pwm.yaml
@@ -17,6 +17,7 @@ properties:
       - items:
           - const: allwinner,sun50i-r329-pwm
           - const: allwinner,sun20i-d1-pwm
+      - const: allwinner,sun50i-h616-pwm
 
   reg:
     maxItems: 1
-- 
2.45.1

