Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 12D2547ACE9
	for <linux-sunxi@lists.linux.dev>; Mon, 12 Oct 2026 10:09:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791799800; cv=none; b=szQY6z2iC9n5d4YVSfO+h3ogXl4UMeXzxO4/zpyfCDokk4+g1GOzSH/TQsnIbos8LcffiWhmvxI2IokymvX2gTxOal4O/GJbDV2oEq3TzVBM6bzwRLQTo3QE3+R4si9OqzWKbiHejxlzf9i8aHiqx6LegCcDXvNlbEKvrKN+DdU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791799800; c=relaxed/simple;
	bh=3h/9Irsh6hLdvhKk61bUEKtRVcfu/x6aEEt8IH3OiO8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=u56pc3Yr075D5XdxJODJrOQJ2RYL9F5XcBRWOiEk2czyUnAhf7djzvr4Ypp/gN/JlOAQMTE5KoTfAqjUjvHhLfKSyhNxfY49XuevHgQR9TMwWCgWaHcaMAsQsaR27USZEJTrlG7H3izBbh7NItdXJqtC69O2zH6QAfA/FSxQhwg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=HRIqYopo; arc=none smtp.client-ip=209.85.128.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="HRIqYopo"
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-4a021c809e3so16740615e9.0
        for <linux-sunxi@lists.linux.dev>; Mon, 12 Oct 2026 03:09:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791799782; x=1792404582; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Em+DHux8TygVduIPIQfg6MjS0noelHiEnVwLPezX/Nk=;
        b=HRIqYopo8k4ssCWDgjwmlksqastjrlPkO+ykERfSmacmyk8Ue/uh3eB7fhMBREHi49
         +uYEeeiwyNBIa27qi1UEKhnnjqqWs4doX57Wf9StzLsTDQtJzRpPo5/aD2Q8+0+3TbMR
         est3uK9n47P6zvAMJW0dEBzXnea9sqdwX987Xd2pT1OnMC/cWXUjaMWkViAm32Phjujr
         SNK58LWfrrE+8DXzJmOvUjgV67Maeq60j3qEQePhXURvn3C0Ts+Q09gW2MqAUM3Y2aF4
         sNO1TuAcR+RhXrB71tcZG6Ac2hTlgkw7FIN++F7akfuEx61QfrAHlx41xIl4J4cfSu1I
         XiXg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791799782; x=1792404582;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=Em+DHux8TygVduIPIQfg6MjS0noelHiEnVwLPezX/Nk=;
        b=ZbPMAlwYjBAwNyY/5sjHGqDp9UXapEOD9IRtjJRnJ1Wb/eNHYUa46JU9HqOv++xUzy
         v2x1iWwaHgKLPGi7AIG2POCDwKobuolWLdXfR3Tczuzx/A2IZKZMkS6Wj/VIqgWirPZU
         3X9TKGsZWP0cjHW1JzGEkhjSY0ZvIpXof51ys0XwMb1zq5oByJ9T2lOS/vuU8S29FnO5
         qemZiuDnluxsdt/4ftu87f2wrnzqg09RvkbQ8txnJF+ZJ0Y3GO+i+UPbvO9MpnUR12L5
         33XI2qNJRy8hBi6ShB094KiCbnWonolIe/IxbND9Cr5ZbZpX3mgbVb52TUaNp/ZZSwzk
         OF1Q==
X-Forwarded-Encrypted: i=1; AKwUvByT9bamXir/uNuJJV/4XpYwmNmgc3nQASQrFMSjuXeoOVikiL3jMrUe68QFAa0TSHw0+ezZVkdCbg7t+A==@lists.linux.dev
X-Gm-Message-State: AFq9FYJu+vc0sioJzUTIuq1zJg9JOTjx2PlPb+DyN5qaRQgWnDIFB5O2
	0LHbCUcXnd7JRwe+EnDJmjbi8//L9sBl8Khe9rKCYQGNnppcb3o9OpSi
X-Gm-Gg: AYBFou0+vx0hDnajIbefIsiJui9SyWYpCkVmMbsyiGaWhp6lqPVRbWpe11GXuCzV4hP
	meDNW+oMVYaPoSOmiUO+DfMkNapgyrmLy/HZh1R/HkwhoOBQ0Uloh0XEuypag9wVO3l1M8J0pdV
	yDXgZEjnnfvWLtyHURs8ccdLG9V3sBdupmo3GHJsU7fngomI9h9bQ9NLJcQWByBpYx+Ar/AJ4Z1
	CMxaoewrIpPsFueOXPqvbGW6WDUEiuGNEzXwITeNICFHCP/vI/8dlUkhIau6lujrq0hvLDsNyXG
	v8cFMRCmwOmRwwFdPh/bTlgpBUu0jQFDYVYrH2jFUpo6hT435YD9RmuCajZ1yy+blx1Ll64zgDY
	SX/porc9aJVKwTrT1jd2H9+PH57ao9rs6USBZzxcRJTJVsHhF7gogWVXn4BSGatG3GWV5svoFDK
	ksfhWYYNsM0pnI9FFUraljoo5TcRxQeJ2dL/ZRRmyRNhOQN74+1rN64RunGyJ1cyOuF7d5+3RNA
	VgIAq9iBbCQSh94Qvn+5xqC8pxpX8kH4xAu2R15kuE=
X-Received: by 2002:a05:600c:524a:b0:4a0:251f:a726 with SMTP id 5b1f17b1804b1-4a18e4a54f2mr179156715e9.24.1791799782124;
        Mon, 12 Oct 2026 03:09:42 -0700 (PDT)
Received: from debian (ip-78-137-176-146.broadband.digiweb.ie. [78.137.176.146])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a192d3efb6sm166229885e9.1.2026.10.12.03.09.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 12 Oct 2026 03:09:41 -0700 (PDT)
From: Pablo Mazzini <pmazzini@gmail.com>
To: Chen-Yu Tsai <wens@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Maxime Ripard <mripard@kernel.org>,
	Radu Rendec <radu@rendec.net>,
	Rob Herring <robh@kernel.org>,
	Samuel Holland <samuel@sholland.org>,
	Thomas Gleixner <tglx@kernel.org>
Cc: Pablo Mazzini <pmazzini@gmail.com>,
	Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>,
	Andre Przywara <andre.przywara@arm.com>,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-sunxi@lists.linux.dev
Subject: [PATCH v4 08/11] dt-bindings: interrupt-controller: add Allwinner B288 NMI
Date: Mon, 12 Oct 2026 11:08:13 +0100
Message-ID: <20261012100816.331033-9-pmazzini@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261012100816.331033-1-pmazzini@gmail.com>
References: <20261012100816.331033-1-pmazzini@gmail.com>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Same register layout as the sun9i-a80 NMI, like the V3s.

Signed-off-by: Pablo Mazzini <pmazzini@gmail.com>
Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
---
 .../interrupt-controller/allwinner,sun7i-a20-sc-nmi.yaml         | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/interrupt-controller/allwinner,sun7i-a20-sc-nmi.yaml b/Documentation/devicetree/bindings/interrupt-controller/allwinner,sun7i-a20-sc-nmi.yaml
index bb9273ec2457..179e7842bf46 100644
--- a/Documentation/devicetree/bindings/interrupt-controller/allwinner,sun7i-a20-sc-nmi.yaml
+++ b/Documentation/devicetree/bindings/interrupt-controller/allwinner,sun7i-a20-sc-nmi.yaml
@@ -29,6 +29,7 @@ properties:
       - const: allwinner,sun55i-a523-nmi
       - items:
           - enum:
+              - allwinner,sun8i-b288-nmi
               - allwinner,sun8i-v3s-nmi
               - allwinner,sun50i-a100-nmi
               - allwinner,sun50i-h616-nmi
-- 
2.52.0

