Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.160.53
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793649333;
	b=jkbwKKI3SuZGqcya852sGkfts51lUdmxYA2h4HHsntNWBXlbHbh/5i7iv2xbUiKnVzLb
	 lmVxIVxkwP1CXxG1Z1ce2JV3Y6kK74JZVnlFDnlWsf8uxc0Mdj+CCwkzRlPIC+UW/lcQ6
	 thVK3di6h/MODmBMayif8lyHHnDQFQI50iJ3zoRsiBh/Usy6GDI5cbd5F9TkKvE0qRtRj
	 gNA4c+FTHvQLEQcNjlVm8kwVUXFuEk54UbkQ6AaqdU84TpqhqMe+G/x5xUliV+wrdK2Qi
	 g+E9FPQPXcm4kuzv5rrZ7h3aB09pd3bZnEH3aN+JAKmh49c98uisOlUcI8nBjGkHwZg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793649333;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer;
	bh=QlRh548rr3RZodybaeLisbTTWEcq7cqJLOra+2wCfg4=;
	b=QrFF8vqUheaATe6I0Hs21CNSov1uifrWOun5KwjcANBuO/VM6UE/nqqN7EHYJTE+xxYm
	 Wu4B5cJE4Axu6jt+payJ44F5ERhgtacTqB+a+Dn8vb4PLrpcgj1OYYX7VRc9F8FmHr0Lo
	 FgkqLxGNo0MjAGMADzwJSW9ARAlASmGrFL174h8A60LNWY+lw2VxinMzDz8WZFPuxDVDJ
	 RovZr2m4FWw6ZmuE4tWK0e4S5MAsh9WEFJ87uu1KxzjvGfpEjTjFSwe8SoDXeLJ/Vv1+r
	 0m2VSCs6MkzPeuisljWvtQu/RwMVckMfVhNcxAQP9aTKtdRjiSai7erWjbN8OGhYDbg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=VBr6rZM2;
	arc=none smtp.remote-ip=209.85.160.53
Received: from mail-oa1-f53.google.com (mail-oa1-f53.google.com [209.85.160.53])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 53ABA6082BF2
	for <linux-sunxi@lists.linux.dev>; Mon,  2 Nov 2026 19:55:32 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 53ABA6082BF2
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=VBr6rZM2
Received: by mail-oa1-f53.google.com with SMTP id 586e51a60fabf-4a76f63b243so7350fac.0
        for <linux-sunxi@lists.linux.dev>; Mon, 02 Nov 2026 11:55:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793649331; x=1794254131; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=QlRh548rr3RZodybaeLisbTTWEcq7cqJLOra+2wCfg4=;
        b=VBr6rZM28tsoLW7rN1LIScnjLdZ/OhvRqS19opEJPHHMJAqKsnWeUj+YaGTrLqrwNK
         pyhgOzZvxKPvFH0IQYL+L86j78XWRnVxmtMfS5T2OnNv/yQWxrHDavSN3waXZq+nYR2d
         2wn0n/fph4qKmoym2AaHN8eXH4QRVk8B0LUX08bZ4wQh9ruJ6rVh/tGMvFOCc0bkd3Qb
         PeAJmQtttflV7tOiQCbzHgvJmOgD82t5m9QOWcEwA4SbsaxSffKhFxQ8/PXvZApqeQpM
         e5PhyY0qZzfxKn0CaPwmEBsMvYlrqRpYPmXLRAkIK3Pcvi26fxLe+4rQW5FQH1h7unaJ
         G4UQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793649331; x=1794254131;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=QlRh548rr3RZodybaeLisbTTWEcq7cqJLOra+2wCfg4=;
        b=UnsidtgI4B6Y/AQJoBtJmxYKJ3HtGDGEUC/zcjMH+Azowgme1W66R78gOqTwnohWPD
         MteVA2kfrc5o3JpKhTI/Z2hIAGplngtyItSZmat4t1pt3+l6lSnk54JvEPgWle0gUJd6
         MALAxQOsUw3CB3YqSoXAMom2lNw3mGblaVws4r9NhxHsRNt5CKnNCv96rI/GGloyzgBr
         PYhmGVmrIIAQ/g44m8bnm7aHhg6uqt/8x1YxsWx+2yFK3F9cp/iVBg4kKh4uP39pAY/f
         pIvJZMzbSwUjUL0QDx8aZLFOnDtS84olK8Vz8FTxEIxn8HZPi6Nh24bHyELK0d+bK0Np
         he+w==
X-Forwarded-Encrypted: i=1; AKwUvBy2POhBzpl1CxjjAu6pZtl+A7c92Gg8dHnMVj9Yv0PY8lq3OGWAAZ4cIeGjs01zhoSi3so/YHFaoc7/HQ==@lists.linux.dev
X-Gm-Message-State: AFq9FYKRyngcXy/oZAkusOaguTva62Mn3360dqT+FhFt+gQctovhvwrq
	1hlTgRpNPxixJ0ZP43TTy5z+Gjf37kCkBBm87V0d+zTrBZWGohlu/1ok
X-Gm-Gg: AYBFou23JgMgNMwNzU9plwBK6Uzva/q5uI74mnioxcOpDeg/zrKx+ikEL7zM5u2SsBY
	cSpZWRhPjrYvr78/YuOcE2KPepjP9Bw2/nUHCcH1Kqd3yaUBVtwryffOCWFnuTSf+IAM+AtXdRA
	EFkkg+z2Uwinn5/hQeH8qauH4kVZpvkZs6tACvHOeI7yeC6WWS5dMKhZS4TQsfqB0uADl58oxi3
	K3N+LZwYtObcZCT8+fPXMcZO+NHpAUxhQM9MXo9rZgu/Vxguz8GHp7R7OwHUvZ1gxqhhPzbd9ZG
	avHot7sk0YS+78haBtAhzyg5j5QXIh8WYacp28KmWYCfke75wq33EIjjgBkxbGeAYe0RpBXaK8g
	bqBrDn/0sxsSV6EesFU9VJmeWdvJ2t/R/RBNKcfcvhrxwFb+HrclDN6/ZuJWWsNc5Cmi24PRzd+
	z0gRmxzj+JHGG8fG7BfEAamyHZJJT+4MyXRyva0lunnI08upCVzA/jCBahGIuXqqLTFiwEpxWQV
	X+jfQ2q7ogbJlIU33lx1T+ZrrXmzsmKj5r8GNPB7wnJFIVaO0l7MqEgV0EgZzApH19KYHKm5upu
	nY1Q3gmYfbCv8+Jh/WwDlfslL//ZmhOWRSo+Jz1mMXCOnpTzgwDERRhUcpmhfQR/enckDIe3mr+
	ZqY5lBNYzsoJcgrGkjkS1iSbGhGWzMwHn92hSBNgIZm45JCn9ZdplMpYZ/Lqq6CGRmHSUtBHNEd
	Z2K35SoTIXB5Gq9kqRc+AItuTpAtyAId/Nh5DxyVAFaaltAFr2YPk=
X-Received: by 2002:a05:6870:f150:b0:48f:e0f6:bd51 with SMTP id 586e51a60fabf-4a8e0ac1b8emr6815144fac.38.1793649331212;
        Mon, 02 Nov 2026 11:55:31 -0800 (PST)
Received: from [127.0.1.1] (174-29-1-49.hlrn.qwest.net. [174.29.1.49])
        by smtp.gmail.com with ESMTPSA id 586e51a60fabf-4a921353dcfsm7809249fac.0.2026.11.02.11.55.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Nov 2026 11:55:30 -0800 (PST)
From: James Hilliard <james.hilliard1@gmail.com>
Date: Mon, 02 Nov 2026 12:55:21 -0700
Subject: [PATCH v6 6/8] dt-bindings: serial: snps-dw-apb-uart: add
 Allwinner A523
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Post: <mailto:linux-sunxi@lists.linux.dev>
List-Help: <mailto:linux-sunxi+help@lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
List-Owner: <mailto:linux-sunxi+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261102-submit-h616-uart-fifo-v1-v6-6-25afcb346b0c@gmail.com>
References: <20261102-submit-h616-uart-fifo-v1-v6-0-25afcb346b0c@gmail.com>
In-Reply-To: <20261102-submit-h616-uart-fifo-v1-v6-0-25afcb346b0c@gmail.com>
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>, 
 =?utf-8?q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 Jiri Slaby <jirislaby@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Chen-Yu Tsai <wens@kernel.org>, 
 Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Samuel Holland <samuel@sholland.org>
Cc: linux-kernel@vger.kernel.org, linux-serial@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-sunxi@lists.linux.dev, James Hilliard <james.hilliard1@gmail.com>, 
 Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: b4 0.15.2

The A523 UART integration has different FIFO depths across its controllers
and reports each controller's depth in the FIFO Clock Control register.
Its receive thresholds are fractions of that depth, and its optional
register layout differs from the generic DesignWare integration.

Add a compatible for this integration, also used by A527 and T527, with
snps,dw-apb-uart as a fallback.

Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 Documentation/devicetree/bindings/serial/snps-dw-apb-uart.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/serial/snps-dw-apb-uart.yaml b/Documentation/devicetree/bindings/serial/snps-dw-apb-uart.yaml
index fc1289073241..ea6ce99178e3 100644
--- a/Documentation/devicetree/bindings/serial/snps-dw-apb-uart.yaml
+++ b/Documentation/devicetree/bindings/serial/snps-dw-apb-uart.yaml
@@ -61,6 +61,7 @@ properties:
       - items:
           - enum:
               - allwinner,sun50i-h616-uart
+              - allwinner,sun55i-a523-uart
               - anlogic,dr1v90-uart
               - brcm,bcm11351-dw-apb-uart
               - brcm,bcm21664-dw-apb-uart

-- 
2.53.0

