Received: from mail-wr1-f46.google.com (mail-wr1-f46.google.com [209.85.221.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2EA0F73184
	for <linux-sunxi@lists.linux.dev>; Thu,  8 Feb 2024 10:53:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1707389589; cv=none; b=Ag7SP4a2qYNis6hM++l0IgmTbYUJbqCgrKCwgsWzJ1ztyZsE3dANzRiTNGENg4zRHI8qMZdQdHexfNi7hHXF42rJXvN3FS64UIK4krX40eAE+WYFaBhquSNA4pt43R/fFB95bWaSm5U1HdjpQUYRzxyF7KouqeiA5Xk+IhdOobw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1707389589; c=relaxed/simple;
	bh=MZAwqIqKrU2y94/Ns3TN22kLxM0VGP3/4mnLhQusbZg=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=fn9MXGJkLoUZtdXsQewp4aeueygXDdYhMKOG1UzIBkFqqYbCbz7jo6FUNyXNI9SA8Cwgvvs0hArpEhjflvqRtJGm/vtG2307xeUJQQ0atFvyYF0EVnZvixMxpfdtOVKPPkBCWP65EV9+SNWsvKu9qdH8Hg5vKCSBguDOuSOFtVw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=o2DYeqT7; arc=none smtp.client-ip=209.85.221.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="o2DYeqT7"
Received: by mail-wr1-f46.google.com with SMTP id ffacd0b85a97d-33aeb088324so1156995f8f.2
        for <linux-sunxi@lists.linux.dev>; Thu, 08 Feb 2024 02:53:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1707389586; x=1707994386; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=7mWzKWd+T8PsoQYOe4XSt67Daig4dIyeudjH6Sr2oBc=;
        b=o2DYeqT7u6Kugt4NyE8VYNbxY2lKkY9rxR1idPCoyQC+fx5UgwnmXsei/ymevnmzed
         J2umpNs8x/ccB6g92x7FJPEq7vOGhluPU+Q5sU4Op1ferwH/jfAWcGyGY2rnuuldcD3O
         w2jar3CaLn/yVfN8NkWJve1sBGEhLI4B0vf332lRfNwh/K01fY2M2RunWvdLg7uuRUHr
         407pFFqbxHs9WkSraO7nem9UuFD8ZhEaO1XoFVUVmUoIzkbfSwjMFnU42jA0+jMQlzV+
         qDYGjf+6D5pQr+tOFlN58jBemJa4vVawQtsp7de/OccrPXHDh95pH2KJgUdZmDAhfuD8
         CKIA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1707389586; x=1707994386;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=7mWzKWd+T8PsoQYOe4XSt67Daig4dIyeudjH6Sr2oBc=;
        b=XW/zg2GtvBrVJ0JABIQ65gJFEblzF+JzcQoo+4VANuvkMFjzfLvijKKa23VWRioR9q
         ODP0d0XQD3TzT/oQck2vcjS6q68xPkrTqr5y8vLuV/Jbd0sJDlTIGnY4sFls3MzzmueZ
         RlsFvrIbY5hY+iA7VrAKzwXMELuxlzxIYVROv8N+5/V/pqYWqXJGtJxER+93lVcZsHHu
         OnxDzLHvJaXbTnBnPYfepkuV9GwKHSjLMVbNOxC6hfOqihzXC6IAvV+hdHvJOsFQ1d9g
         XdfrRfyMnXLljSDZpbS0Ul8AmPJTI8FwAQNKNW+KLVQCZrLaaiw9AMbPvKQup2F3EAp4
         EikA==
X-Gm-Message-State: AOJu0Yxor9pSS2ThM/aY3dhF2j16XZVJCPgaL7eOEvdjtPh81cZuq183
	4iAWejHQoUT2AkIyu14fU68glsWYHtnavUAPS6w33qF/VHeFDyEKjlviXaJqjHg=
X-Google-Smtp-Source: AGHT+IG0Zb001fVAHJZU8yomzCgm0LXfKKPq4aLuG2BOosKb06k0rgl0dn+3KVyOGyNEkllw2sxQNg==
X-Received: by 2002:adf:f051:0:b0:33b:26de:ea with SMTP id t17-20020adff051000000b0033b26de00eamr6647711wro.37.1707389586350;
        Thu, 08 Feb 2024 02:53:06 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCUT5rF4rLVlPKJRWVJKuV4G43pCj8lNaPxXW6zxwv3GZE9s4c9dlrnojgp9fUQFZffLSPbUWIuwqZ+JjtevgNK4ljShOetxTS34QkcvucZMxKYimXm9gHCuN03gppqCs6QNUcEgwLGdVYW3clJhiAkAGV0e4JIRID56sAAqYPjTK75bdPAFwvycu/mN3kT2B47sOZd1pNf4DAMRWGj6n38bGl0Z0FKRWCkH8qVNAdrVRyQ37yqRODnkd16qFwLODT20zMTWB1Ba0X18vHkzatBNfg7N5pyzjAIkqWuWv+Dapbp8ozcJ6CwZqyTsZj4Sv71UssIP3PW5WJ3fswOm3A==
Received: from krzk-bin.. ([178.197.222.62])
        by smtp.gmail.com with ESMTPSA id u10-20020a5d468a000000b0033b44b4da56sm3331975wrq.111.2024.02.08.02.53.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 08 Feb 2024 02:53:06 -0800 (PST)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Chen-Yu Tsai <wens@csie.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Samuel Holland <samuel@sholland.org>,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-sunxi@lists.linux.dev,
	linux-kernel@vger.kernel.org
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: [PATCH 2/2] arm64: dts: allwinner: h616: minor whitespace cleanup
Date: Thu,  8 Feb 2024 11:53:01 +0100
Message-Id: <20240208105301.129005-2-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240208105301.129005-1-krzysztof.kozlowski@linaro.org>
References: <20240208105301.129005-1-krzysztof.kozlowski@linaro.org>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The DTS code coding style expects exactly one space before '{'
character.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 arch/arm64/boot/dts/allwinner/sun50i-h616-bigtreetech-cb1.dtsi | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/allwinner/sun50i-h616-bigtreetech-cb1.dtsi b/arch/arm64/boot/dts/allwinner/sun50i-h616-bigtreetech-cb1.dtsi
index b2988f500231..af421ba24ce0 100644
--- a/arch/arm64/boot/dts/allwinner/sun50i-h616-bigtreetech-cb1.dtsi
+++ b/arch/arm64/boot/dts/allwinner/sun50i-h616-bigtreetech-cb1.dtsi
@@ -93,7 +93,7 @@ axp313a: pmic@36 {
 		interrupt-controller;
 		#interrupt-cells = <1>;
 
-		regulators{
+		regulators {
 			reg_dcdc1: dcdc1 {
 				regulator-name = "vdd-gpu-sys";
 				regulator-min-microvolt = <810000>;
-- 
2.34.1

