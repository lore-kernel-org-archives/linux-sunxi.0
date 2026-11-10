Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.161.46
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794285921;
	b=CiCy1sDSQVU/NpJ9xUILWOGBc9BAoFgER+NtN2CKrrRAyAaUJGJpdztTqWBVABUecDOX
	 NBL4e8gpqyEnnR8VQ5yDrVaJR2izc6xvG5XjQZiHfLmdMGDsl88q+UpjDllNzFwrfah3n
	 zaMV/st+R8485U4LNHP2Wm+A4KySDGDu9LXk02FpO6oweiX5NIktYqFyvVFTd+hBjAzz2
	 Y7YQSUT87HG3gPE6yMqYWbzu0lYDkq2RdDbCzGM739ETIIyQs7lFSTEA9pzSTfxvaywPR
	 LKWLveAT5Xr3rryHaff+T5F7WN3zuDU3cSoXVy8SwOGIKbBK7GQN+4xqj8UZy5F3zNw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794285921;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=mfk4qwSgFR7KwVnesFbvf+7aq34n17lW7fPSZsmBCBg=;
	b=XwknMF3zmnYedqEsfHK19KZmBKXGf/xl4S+M/HnqH2SSGt7Mr8Sb27t+dByQcbBVggiZ
	 U5GqqzSMeOtJcG/YWME1S7XU2RwnJA94E7wFRC9kOZyA/MbpxX5U2oQYEJwl/g1XKr3JB
	 +K8WEFlabE8OoMEKfX94JifETZRx/Ctu9BUg+y7XzKn8Eqs+5zMfezOHk3OneKsaH8SBo
	 reOikLmcmoz3Os+3DNo/5P8p2WUB8Lg9RlIfwjQo3GhPYaOjX6ABZrFqptubxel/AdDD4
	 5mM4zSc0L6oPMVnO6qm/LlmmA93ciyMQzG5ux4zkpm6nO4dsF+OedassAMmkcVXJshg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=DnM8RcuN;
	arc=none smtp.remote-ip=209.85.161.46
Received: from mail-oo1-f46.google.com (mail-oo1-f46.google.com [209.85.161.46])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8F24760A2605
	for <linux-sunxi@lists.linux.dev>; Tue, 10 Nov 2026 04:45:21 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 8F24760A2605
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=DnM8RcuN
Received: by mail-oo1-f46.google.com with SMTP id 006d021491bc7-6f8a519e215so1346105eaf.1
        for <linux-sunxi@lists.linux.dev>; Mon, 09 Nov 2026 20:45:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794285920; x=1794890720; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=mfk4qwSgFR7KwVnesFbvf+7aq34n17lW7fPSZsmBCBg=;
        b=DnM8RcuNEi7R0JQz0wYJ3DuNcJR1Dd78clOVBsAqpqR9rnVYG7aKGULErwtEfIdRnr
         dAkZSsy6BP7GBjotKoIkHFTgdzX/PA+Kl46B0aamkv4mX1ArX+7R2vSa3XwnA/YU9YGd
         HFw7PgN2YUcC8GKrjdoy5AZxIicKfluyCbQ1dQKrtc1+YOPKPxsMH4677KW/7LwE6nUm
         6OuNUwf5EQWN8bApf7YCfTbGCJVAu4qcwtQjY+DOq/n7D2+UA05o+03GwKSw+52i1N1p
         8PUrXjkP+nr63uU7u8bKbH4mc9soI9OIaRPjM47lnGNl0tY7vfebyAX6byoTekOYdIZH
         QFIQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794285920; x=1794890720;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=mfk4qwSgFR7KwVnesFbvf+7aq34n17lW7fPSZsmBCBg=;
        b=PdlmBosCPajVxPkXMYY64IJNQPdpppA/Zrh30fV4tO2U3uzIOesLkX6mDi+wOyasIZ
         dkmKGNuRLt+y7yMcp9aEa0m2RcWmuRAtCTVExxF2HibunhmfXMwDISkpLAAVhUMNpVIO
         aO2k9ZnN69GcCyYufAn6Vm8Z+X+hKdyAGbclPd8uM4j99HChAZdwBTXOE3UtE7MkEOPY
         M7NFSai9VxP5qfmNV0PV1UxIRLdomtDQWeQsWl0UenjWLMDVOrQOHqM/HyPGvyQqu/Hg
         KV8sxqy/DbHOMf0hWAVLMXdDTeLkqaNNXZNEIgitkwbQVmSy91o1u9jLriPVcgyyjF8j
         w0Lg==
X-Forwarded-Encrypted: i=1; AL+hErFCUexPqPYF3Jlct6rMGDVlVWvdkV+hjg55/RNYlbq9w+uu+dSPsUhc0gA6DeImFJxnt+cuy65XcxDY3g==@lists.linux.dev
X-Gm-Message-State: APuU4Z+/f5WnRpNo7JZtHJLuTtLFy/BqAUEdeY3S6wPqhyEAcEGqN9Hf
	mKu/Hbk9Vc2crIpie4KKDuwIDpL/vnv4Z+nlTQyUsLgiPSb9JQN0JEn0
X-Gm-Gg: AYBFou1opCCBpKXRPiHR9XNXZaOzxsKLIexnJN5cOAaqmf6bFk+0yIlqiqUBXmZW26T
	84u9RqpX5o/po+OX908R0FfYDSdbmNRqiUgrskATZ6RAtZXhpQTuJPWzeUMe0wAawX0rF6uJl7N
	Ehq/L2z3XvHDrKtMbCWb/VSKWDvFxDVXepu0HqfB170CE/H8EWbSuHteZuC34Hwu0R6CKE6o5Gb
	kk8vNoDaY4xZtp6iV5oCwpxQALE53DSg2JgAi9VhD2qsNcNScRe1oefLj9rWETNQleBsWbht0a4
	B1V+eIzW9LEm6zMW5IdPkibEtxoJb7siuH+RBhLrG4V0WzW9rkeanMg2GQZHGAduWRu8RSufPW2
	prwKK4AijH2cerlaQKs4GXcu+xzBJrEI20Q1aNJUvkNvFHaRcszESzNLMIJ9qwrBZoqnfSrGCF3
	8n7k20f4AMa9P8pb0ljbJT1ChEt+2JlVWLuQKmU/GOWbpXQXVpkKgMNwoi+QS62GndvEr6pm6Y/
	IdkyQbKSxKHgHKAOZka2tppr50JBozX8lTB1n18su8oX1XreQ+xbQshXCh1Tqj+AHW3rDl2teHn
	Ka/WTz4tEh8ttOvrf7XIDBz9Q+MzwPGQgPqNV56yeZQ3fyj1R8RS+5SABSlmjJqmRuStpMXUDBN
	Muw4Nzg==
X-Received: by 2002:a05:6820:c2c7:20b0:716:e2da:28c1 with SMTP id 006d021491bc7-718a77f2696mr394873eaf.39.1794285920417;
        Mon, 09 Nov 2026 20:45:20 -0800 (PST)
Received: from AMD.home.internal (dhcp-9-244-8-156.gobrightspeed.net. [9.244.8.156])
        by smtp.gmail.com with ESMTPSA id 006d021491bc7-718a40b8a9fsm954836eaf.0.2026.11.09.20.45.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Nov 2026 20:45:19 -0800 (PST)
From: Enzo Adriano <enzo.adriano.code@gmail.com>
To: andre.przywara@arm.com,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	wens@kernel.org,
	jernej.skrabec@gmail.com,
	samuel@sholland.org
Cc: Maxime Ripard <mripard@kernel.org>,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-sunxi@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Junhui Liu <junhui.liu@pigmoral.tech>,
	Jerome Brunet <jbrunet@baylibre.com>,
	Pablo Mazzini <pmazzini@gmail.com>,
	Vinicius Pedrosa <vinicius.eduardo.pedrosa@gmail.com>,
	Alexander Sverdlin <alex@sverdlin.org>,
	Jun Yan <jerrysteve1101@gmail.com>,
	Lukas Schmid <lukas.schmid@netcube.li>,
	Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Subject: [PATCH v3 1/3] dt-bindings: arm: sunxi: document Radxa Cubie A7S
Date: Mon,  9 Nov 2026 23:45:18 -0500
Message-ID: <f1da763aca9c4978dd7cd9a363548b5e53314656.1794227241.git.enzo.adriano.code@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <cover.1794227241.git.enzo.adriano.code@gmail.com>
References: <cover.1794227241.git.enzo.adriano.code@gmail.com>
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Post: <mailto:linux-sunxi@lists.linux.dev>
List-Help: <mailto:linux-sunxi+help@lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
List-Owner: <mailto:linux-sunxi+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Document the Radxa Cubie A7S board and Allwinner A733 SoC compatibles
for the accompanying initial board device tree, so it can be identified
and validated.

Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Signed-off-by: Enzo Adriano <enzo.adriano.code@gmail.com>
---
 Documentation/devicetree/bindings/arm/sunxi.yaml | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/Documentation/devicetree/bindings/arm/sunxi.yaml b/Documentation/devicetree/bindings/arm/sunxi.yaml
index 28437c47ac01..37a7d713ac71 100644
--- a/Documentation/devicetree/bindings/arm/sunxi.yaml
+++ b/Documentation/devicetree/bindings/arm/sunxi.yaml
@@ -857,6 +857,11 @@ properties:
           - const: radxa,cubie-a5e
           - const: allwinner,sun55i-a527
 
+      - description: Radxa Cubie A7S
+        items:
+          - const: radxa,cubie-a7s
+          - const: allwinner,sun60i-a733
+
       - description: Remix Mini PC
         items:
           - const: jide,remix-mini-pc
