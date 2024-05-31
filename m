Received: from mail-pf1-f171.google.com (mail-pf1-f171.google.com [209.85.210.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 89CD716E867
	for <linux-sunxi@lists.linux.dev>; Fri, 31 May 2024 14:12:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717164735; cv=none; b=oQkkqW3DkO3EJNwTWXO5J/ZeFR78uMI0mbVI0Unqm4SvCyhQW8Pd679tcgTI1t/oeYPGvMy56RKPaBhseWNyrnpAGZtrevFRd7r9YeAXo6DlhwJ7vCTGpiP8ABG9aki8Hf6hnI5yQ7TLNMHBXbRZf5JwEng7o3taBfjTrNi2ONc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717164735; c=relaxed/simple;
	bh=XLqZFjlEoqxOyPl9bFUh7Jqa2hmuAmBz32zTzjZrBpo=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=ZyYEaKIYWaXc8LnJ6aiNKx4oWLHfyX6T/CGxqMXV44dajr67AkXsie3+qQzAwNYQC0xHxEeQQou+uJp7tDxT/cMlRDvzGb1y3Dd+5FOsCbNjhIV2RaGI3RubGNvxs6Q7oERM9rF81SVYbt7CaVGIaJ/yLLrABf3zPS1spGAB5A4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=jIslLO2T; arc=none smtp.client-ip=209.85.210.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="jIslLO2T"
Received: by mail-pf1-f171.google.com with SMTP id d2e1a72fcca58-70249c5fb36so544092b3a.2
        for <linux-sunxi@lists.linux.dev>; Fri, 31 May 2024 07:12:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1717164734; x=1717769534; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=Ykvp/0wm2JKYn1VhbfeNlnxDMxT2k1KfiM797oH+i0A=;
        b=jIslLO2TgPfJV2BL8Ug1Xw3FNP8ep/EBBGnYNheXGeTEY0/suwFfqmkYvxOnajTc6Z
         hmXAsmNv7ckg+C8wpFIqr2xXVEJW+uIhrljTZ0U0L5Tp/PeXBmtUEPITtLpK30OUlICD
         2WePl+xEVqdPs33qFIYuOhXauSEVkaQm2jKfcyF4J4bTEk6mbAMT3Ay4aZ/Yal6lVZEo
         pEH26GTMWSa6nN9YDHquBF1fSiLqSJEHgZzlHJgm2/meXGaBHgSvnGBXScARMTVD1KLJ
         +oi3A8VTXrJcO+47/IWkugnWswjhn0BA7OAF3LSTQCY4ckIBP8BA55MAreiouceiBsdA
         mKcg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1717164734; x=1717769534;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Ykvp/0wm2JKYn1VhbfeNlnxDMxT2k1KfiM797oH+i0A=;
        b=PVDeweguT3Hxjl30j8UhxMFnsmJaqwH4Rd+XSIYK1PI6kvq73hxPSBWYi62bBOuXlC
         mNTjNFooezIduwoeB9bTg+4AT19fbNjM/Bs01quLQ4AkHJKqPh8/BWL/Xe24TeWFWgo5
         C6lE5FMwGjsCn5k7gnFeyoohKI9CeEoW3ZGI6+D3T2LmLlzJQ1mqBGnvcqSsVazPfTeu
         IqKusvjf4fsAUfVD9SLb8f/8EdWRo9KNw87YRsYdDl9KokjtE4Bn/0k0dCPoVPgsePSJ
         qGNM5iws83UaDzpvT4dwvRLIQzSv+CoSGe8byU2kgSPF0QzOEtRktbtAKoPlx+B5v4s0
         XRXQ==
X-Forwarded-Encrypted: i=1; AJvYcCUMQ9lRDkG8ryMgZbRkR8JojBIYuO7aLH8ROZrgpU7SfgtBsRXWUXxytK8OHolNC7ILDOyrusBdhAZt0Rbn0XkK19O2jTdMcEvnQlE=
X-Gm-Message-State: AOJu0YxyQnsFRVudRkmufU+dcQ0VowVg0Kx1868A81oTVkwoGgQblC5q
	I10CItAxXlgxRYDtCzJllwvYcoBxo+vEpiahlVJuYhboc0ht6vQh
X-Google-Smtp-Source: AGHT+IF9QK1BGyLlONfFHI2NZ/q0q6TlP168YBjy8Girmb88VacbO8e/f7OnxTM2vSORBcmJgAyihA==
X-Received: by 2002:a05:6a00:1785:b0:6ea:f05d:d2ec with SMTP id d2e1a72fcca58-702477c2abamr2233447b3a.2.1717164733748;
        Fri, 31 May 2024 07:12:13 -0700 (PDT)
Received: from noel.flets-west.jp ([2405:6586:4480:a10:167:9818:d778:5c14])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-70242b057besm1418103b3a.162.2024.05.31.07.12.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 31 May 2024 07:12:13 -0700 (PDT)
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
Subject: [PATCH 0/5] Add support for Allwinner H616 PWM
Date: Fri, 31 May 2024 23:11:32 +0900
Message-ID: <20240531141152.327592-1-kikuchan98@gmail.com>
X-Mailer: git-send-email 2.45.1
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add support for the Allwinner H616 PWM, building on top of Aleksandr's
Allwinner D1 PWM driver v9.

Additionally, the 4th and 5th patches implement the proposed method
for delegating the clock source and DIV_M selection to the Device Tree.
While it works well without these patches with the original behavior,
applying them enables fine-grained control of PWM resolution and
prevents non-deterministic behavior dependent on the enabling order.

I have only been able to test on H700 (H616 variant) using an
oscilloscope. I would greatly appreciate it if someone could test
this patch series on the D1 or other models.

Regards,
kikuchan.

Hironori KIKUCHI (5):
  pwm: sun20i: Use devm_pwmchip_alloc() helper
  pwm: sun20i: Add support for Allwinner H616 PWM
  dt-bindings: pwm: sun20i: Add compatible string for Allwinner H616 PWM
  pwm: sun20i: Delegating the clock source and DIV_M to the Device Tree
  dt-bindings: pwm: sun20i: Add options to select a clock source and
    DIV_M

 .../bindings/pwm/allwinner,sun20i-pwm.yaml    |  20 ++
 drivers/pwm/pwm-sun20i.c                      | 326 ++++++++++--------
 2 files changed, 201 insertions(+), 145 deletions(-)

-- 
2.45.1

