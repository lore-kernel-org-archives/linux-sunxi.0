Received: from mail-ed2-f12.google.com (mail-ed2-f12.google.com [74.125.228.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7552E4E56CE
	for <linux-sunxi@lists.linux.dev>; Mon,  5 Oct 2026 20:28:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.228.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791232132; cv=none; b=GIb0NSZvKzMItIwFnQv6y+LwFLShYIRKhp+zSGp75SBvnjj3o0JeWeSnNlpPnXM6o/0mEwQkSIZDMC3BO6vXXyyH+krGTCaP8kfR0+JdU98kYArwyfjeSRBdEkbha+TDQQQtuJQo2JShOwzcF96u+0v8qHOukIx8d8LqTkIsTUE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791232132; c=relaxed/simple;
	bh=nSeIB9SqI3YR3qh8EwI2spWM6L+JrfQJZacP9d3kjTw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=ZlVQO4XkmZRAThP5u11mkiejIPZtWbmM6pgz/Rjki6hOTnXpHt0AkaN1DrH5dgNeheoMC7Jlv+B78cDU9tdwAyojUIIfnc+TdkVn3x0fMp0qK54c3lVrw06+ZkfngIBEvhvaDSiuYT3amsqoqpyuqcz1OzldAPSM07TN2wdRlqE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=WOTNbVid; arc=none smtp.client-ip=74.125.228.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="WOTNbVid"
Received: by mail-ed2-f12.google.com with SMTP id 4fb4d7f45d1cf-6a60591ae54so2965213a12.3
        for <linux-sunxi@lists.linux.dev>; Mon, 05 Oct 2026 13:28:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791232112; x=1791836912; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=J3Qc6M2FWp5fQpmardGXk9w7HUQgqdCLyizNZPwG574=;
        b=WOTNbVidFR2wW1xJO6nhThuzcRLU7ucTApAEo299TpTyuf/ajZOoXyL0Qao+x/sr4X
         wOTDmujOpPvSKMLbnf2+1XTVJwSzIKuOaKZiuOqtSvkwylbwDgOUdWbKfd+Ppf0f9HcX
         7gCiJXaRyJ6CYrOj5AzeUPulwTyIS+jwJLxHY7UXpEt/CEHOB7tg+GNO5cgs3G4D7M2b
         bDc6vCYtc7oK8x/uXq+nOReokwY0SQz1v8pQolX+EJG0Y/183CVrN/tyI+702t2cKEyU
         8E9E7wJyMBX0qgw5wJ0lgoR3R/jhHffJg8eMv3tf27M8qRtvAUTuhGeek9+49lHjLLSC
         ZORw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791232112; x=1791836912;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=J3Qc6M2FWp5fQpmardGXk9w7HUQgqdCLyizNZPwG574=;
        b=PsxQ0j3cTe8a9DJYi7GEBFQftBRjsCxXYbBosG2Yz/+qxlHs3TLDCtTGO3rJ3m7MM8
         BWWrVe/S9767kOIQqxDWT3CkbXa/VUHz3ezo6pB5QGxBKK5CCjK0Dq27ZpojkdHLk67p
         JrETdvoMD0/JTNcBaUaqBjAcTWBRHgQIEJPe3OivgJJSAMJGIYa011fQXZK4IvHtWDu7
         vANtp7zrsf4Zfgl7bNHseRf9SkIowvrm4pFwu89hILe8H/FBNMBdYGYP24ErWSLx7sPf
         kix7DcCdxiy781tU8ev4kAkeAA5jMAnT/ChCUfI2IeYLDSHyyo+5OUTkY+FVG3YeGGbx
         OW1A==
X-Forwarded-Encrypted: i=1; AKwUvBzZfLKP9ZCRQGjo3OM55uXusM6UkgTA567htGas3WiNNf09QwyeAXYPXT0eYclj+xZPiQjTFEKt0BXzyw==@lists.linux.dev
X-Gm-Message-State: AFq9FYKzfI8teCQrER6cOQ1UjdxZOG/obB1Gpa6QoDAe8DmlcvRk/dro
	6/pK9XeyOmvpQLuyKkADezZbghDCPDpjsxufVwCniLAYw7BE05kKCCCR
X-Gm-Gg: AYBFou3VajkFfeRTHny9zbcedRTehpqHOXkldUMrnLT8+UCQ8TnKxbSCUyUNfGkHVVv
	4LgNuPXDU6Zai4+KXwBZ2n6vHdarzBVTkEGBF1lDlu9yhEOhnFoH0ZfS4VYVUC+u1xcUO5iSvdA
	6bE9SFixN6lxeHA+GDGUBRnFiV+a3NxP2lURkYW91VDI24ymoxSxNC74bK+oyUiRMn7ih98mTYk
	zDN8BXXEKCy0ra9x7esmkpyNQM4cTl/jzvNKdiSmtFD5MKgd38E+GD0pIn9kPmYxjhmi4+SQmTs
	mO2W9O+vuDM0VVPlqit23puKekVl2BbU5vRX/MwGatZUx6jVk1BxMI950D/8NX6MSISfyLDdhCW
	O1IebeBQW/OWnI3eLy8Gd82P0FvXVKOxQDOvGme5ljivnAAXFV4pElnIBj+E+P9RfTRTpk11HNr
	pfUD522IAc+8anWyBkLkxwsGavEUCe0nhwJfq3vCBTaesheDbXLSltDo5rHkHipD8VEJieSH643
	rpOqwRITYy+T1u7L+3fVSBfNAhExoF+rzL3AYB6z98=
X-Received: by 2002:a05:6402:254b:b0:6aa:f11d:b64e with SMTP id 4fb4d7f45d1cf-6af9e34ccffmr10161152a12.32.1791232112351;
        Mon, 05 Oct 2026 13:28:32 -0700 (PDT)
Received: from debian (ip-78-137-176-146.broadband.digiweb.ie. [78.137.176.146])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6afb01e572asm3801024a12.13.2026.10.05.13.28.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 05 Oct 2026 13:28:31 -0700 (PDT)
From: Pablo Mazzini <pmazzini@gmail.com>
To: Chen-Yu Tsai <wens@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Maxime Ripard <mripard@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Samuel Holland <samuel@sholland.org>
Cc: Pablo Mazzini <pmazzini@gmail.com>,
	Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-sunxi@lists.linux.dev
Subject: [PATCH v3 10/11] dt-bindings: arm: sunxi: add PocketBook Verse
Date: Mon,  5 Oct 2026 21:27:30 +0100
Message-ID: <20261005202731.153971-11-pmazzini@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261005202731.153971-1-pmazzini@gmail.com>
References: <20261005202731.153971-1-pmazzini@gmail.com>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

A 6" e-book reader built around the Allwinner B288.

Signed-off-by: Pablo Mazzini <pmazzini@gmail.com>
Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
---
 Documentation/devicetree/bindings/arm/sunxi.yaml | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/Documentation/devicetree/bindings/arm/sunxi.yaml b/Documentation/devicetree/bindings/arm/sunxi.yaml
index 28437c47ac01..fa34786f0652 100644
--- a/Documentation/devicetree/bindings/arm/sunxi.yaml
+++ b/Documentation/devicetree/bindings/arm/sunxi.yaml
@@ -811,6 +811,11 @@ properties:
           - const: pocketbook,614-plus
           - const: allwinner,sun5i-a13
 
+      - description: PocketBook Verse (PB629)
+        items:
+          - const: pocketbook,verse
+          - const: allwinner,sun8i-b288
+
       - description: Point of View Protab2-IPS9
         items:
           - const: pov,protab2-ips9
-- 
2.52.0

