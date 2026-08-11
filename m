Received: from mail-oo1-f42.google.com (mail-oo1-f42.google.com [209.85.161.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 64F3542F715
	for <linux-sunxi@lists.linux.dev>; Tue, 11 Aug 2026 23:12:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.161.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786489934; cv=none; b=VxsQ4JohapWPLckQoyWcaAOgZI3axhzwsHTU67hkea5tEJgpBgKYFbgJ34Ib5S0ttVgHK/wYNpRQjjLyYbfwfXhJDjJc8JeMQaVoFBc+ZOBFaSH+pfQFdsAINn0013xQzmd5RlMWKqZkFINc9PpjGFDe+amDhe5E71hiX3cc4+w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786489934; c=relaxed/simple;
	bh=vXJST93REa+QH10dPJYzmKclTq5eGMoIGhB/tPIJFyE=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=YaRCn4DeRFmQxyI7tRTr+NVWnKQdce1hRx8TBeHMhfdN7VkZTrE8W6nLD2vNr927SD/KcEnoTYxWQsQOwa76Y3hTwxbeQcwCmC7qU243UM+hrrsWa6jboVeQE01DYxpkDlLjEeI+M29IishCJ9/PFQiqf1euflpWP2ve1+HTqvY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=RFlw0PD1; arc=none smtp.client-ip=209.85.161.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="RFlw0PD1"
Received: by mail-oo1-f42.google.com with SMTP id 006d021491bc7-6aae90e595fso106133eaf.1
        for <linux-sunxi@lists.linux.dev>; Tue, 11 Aug 2026 16:12:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786489922; x=1787094722; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=6fiFh2L3bx9YuuvYvD9BsidmGnYklyUdwY2Tqg6czVo=;
        b=RFlw0PD1WkIpxMOQFQlnIJML8uqAiF8U3gTRdprJ2JbdvBWs797Dn0wtVB5RcFe59i
         viSLkGMsLmJfF13fkb5Wico0Vfag0ngmE5YyeN4nqhLdrk30miOg50CPVDuBcGDKmNOE
         PbDhjphyMLtr2uNqR3aeGN9YfMAR8bzwZ6hUS8nd9YWWX2CVnY/bHYBnMDbI+YIw64yh
         sJyvhkRYT/tZc+SFeNiIGkCVV/xPuVG/wITHJcrScuoQ5C56chFuP1X9Q3PQhVHrh1S1
         gmaEcgLG0HqeDIllsud8x1UOtgIH8ZHnzKJVcGA8Qg/gF+g/WIusEYwEvBvXlpP23PMX
         gbnA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786489922; x=1787094722;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=6fiFh2L3bx9YuuvYvD9BsidmGnYklyUdwY2Tqg6czVo=;
        b=fJ/5wLlcvLtKmXSfUVZmtBXHqxQr9fiZtGMjAquRMiE4gaS66MsH8WQtYZHIP84Mw8
         4ywQ7Ly2VI/skzKJFbmnczf9DgLUn4qavhDFkOFw2VWYZxsUBgKBgPYB14CtzYRXrKE0
         Tl9MK0i8YCGWN9Tk4gZ7Tw518/KwTGC2KzwXHkLBVLX4f1FPJYTTk1pl7xRZtkCPkmtD
         W4rbOUuwz04VTToN4HgIiVFKm4+2xg5cgFJP5W4MGHogn03DB/olongxlaP+Q/iFrUy9
         /xmVUzvcWYgW5WYxZPB4j+wguo0NMEJin+fYqIrTJUJY06ZBPsuX5Z5mtOEvqsENc3BM
         C/qA==
X-Forwarded-Encrypted: i=1; AHgh+RqKeIzt/VDLkR21KIZC74XChg8jPEue842QJ+WUJQVieFuf+wntV4oAgfBCivV/buWlcUmZg+ZBUy5Uzw==@lists.linux.dev
X-Gm-Message-State: AOJu0Yz/c9jbDnlZl5DZ1hsjGcqdK8VRLtlbibT+oIzRPFVNJkIcNSVf
	1ad8rwaoq3Pu3O//nOktstvDk9Hkh81byuw4/D/O9KM0KepfrNbscggK
X-Gm-Gg: AR+sD11/Tve4NKbN0kpEm04EnlxOYBj2uWE/Ow3LAz61/FhGBnETuFeHB1OVCFdG/Gp
	0Xrk5DOcZUh3xEFupCee2tfo3OeI8KwDERGqEVhTLNVb6ljh2q60VvvliC5wpBpL/NeChgXcOl+
	Ww/AlV5ZzdKfwcIaGN+oGqJvPcFStVLyL8aLNmDCzokbZ5vejLvhC3C/Gte1i8F2PEM2TNCc4XS
	qfmQU0MX5IKjwhY9dfxPqn3QHHzeXMF8IbEOFvZSRTKhQhyVkkVRUZMQU6X12ykTtmWCjHVcBF2
	nP2PA5zgF5f0+Polay4UZcLJXvhrCx1rc9fX10grO5HTNYtcp9EWnRpxIYAkQBbX0egJT3CAwA8
	ZW74h4Yge0SN+Jvf76kzD4Anl+AmaRvpqTIRPeF2j1Lbx9G3S1aCp519keAjhXESjk8GYloc+an
	xYIiPDRkPjjxOiKrbdP5OkYDk6QedNSby1Lqrt64rzwGmGBfxujDTcppeA7AK1Dsh0VOcmoSmY4
	4sQglGVF6BbLzbJPyWrsaTIzizDv5Ei1rvrCKoh3qFl5Lnn9R3H3s+4VAk4RkoaVz8EsNyQoxTe
	yk0bHUvRqDNxUY5SoPxWey/wr/DUzK2XMXKmEFMOliXxq/xJNKfDqKCXnQBDbcd4cx8s4VooUWz
	KKdXbgozFwhoTxGsh1eJRG+eD9YQ=
X-Received: by 2002:a05:6820:4b91:b0:6ac:c1b4:1a21 with SMTP id 006d021491bc7-6b0b24c8b4bmr559916eaf.6.1786489917411;
        Tue, 11 Aug 2026 16:11:57 -0700 (PDT)
Received: from [127.0.1.1] (184-96-154-59.hlrn.qwest.net. [184.96.154.59])
        by smtp.gmail.com with ESMTPSA id 586e51a60fabf-45e3510fa5fsm713176fac.1.2026.08.11.16.11.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 11 Aug 2026 16:11:56 -0700 (PDT)
From: James Hilliard <james.hilliard1@gmail.com>
Date: Tue, 11 Aug 2026 17:11:30 -0600
Subject: [PATCH v7 1/2] dt-bindings: mfd: x-powers: Add AC200
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260811-submit-ac200-mfd-v7-1-8b06f552a4d7@gmail.com>
References: <20260811-submit-ac200-mfd-v7-0-8b06f552a4d7@gmail.com>
In-Reply-To: <20260811-submit-ac200-mfd-v7-0-8b06f552a4d7@gmail.com>
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

The AC200 is an I2C-controlled mixed-signal companion IC containing
audio, video, RTC and Fast Ethernet PHY functions.

Describe the parent device and its shared input clock. The Ethernet PHY
is represented by a PHY package on its MDIO bus, with a phandle back to
this device for access to the package control registers, so it does not
require an MFD child node. Function-specific supplies belong to their
consumer bindings rather than the shared parent.

The input clock must run at 24 or 27 MHz when the Ethernet PHY is used,
matching the rates encoded by its documented clock selector.

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 .../devicetree/bindings/mfd/x-powers,ac200.yaml    | 49 ++++++++++++++++++++++
 1 file changed, 49 insertions(+)

diff --git a/Documentation/devicetree/bindings/mfd/x-powers,ac200.yaml b/Documentation/devicetree/bindings/mfd/x-powers,ac200.yaml
new file mode 100644
index 000000000000..609831b15c80
--- /dev/null
+++ b/Documentation/devicetree/bindings/mfd/x-powers,ac200.yaml
@@ -0,0 +1,49 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/mfd/x-powers,ac200.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: X-Powers AC200 mixed-signal IC
+
+maintainers:
+  - James Hilliard <james.hilliard1@gmail.com>
+
+description:
+  The AC200 is a mixed-signal companion IC containing audio, video, RTC and
+  Fast Ethernet PHY functions. Its control registers are accessed over I2C.
+
+properties:
+  compatible:
+    const: x-powers,ac200
+
+  reg:
+    maxItems: 1
+
+  clocks:
+    maxItems: 1
+    description:
+      AC200 input clock. When using the Ethernet PHY, its configured rate must
+      be 24 or 27 MHz, matching the rates encoded by the documented EPHY clock
+      selector.
+
+required:
+  - compatible
+  - reg
+  - clocks
+
+additionalProperties: false
+
+examples:
+  - |
+    i2c {
+        #address-cells = <1>;
+        #size-cells = <0>;
+
+        mixed-signal@10 {
+            compatible = "x-powers,ac200";
+            reg = <0x10>;
+            clocks = <&pwm 5>;
+        };
+    };
+...

-- 
2.53.0

