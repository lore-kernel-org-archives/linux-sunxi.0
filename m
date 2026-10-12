Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3BD694779BF
	for <linux-sunxi@lists.linux.dev>; Mon, 12 Oct 2026 10:09:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791799790; cv=none; b=fMjMSuKQTatVJfS0KBuBg4jidIztuykcPeDT1tN8tv17JTrFiJsAemav5FD0p7ICXOU6odC9fs1dijN8q2AQpJXqu5eCYQnNAZNrjgK+0kVWXYNS9N2gSX9h6eAFbx2tefIuAYcC4trv0QojkhYNE4SjL2AArd61YLsvhkecKqI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791799790; c=relaxed/simple;
	bh=lqFyZF/H6AwrrMe7UJI3gtjvDDPQczserSqPhG0tCVg=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=kKK0ZMfn2631g3xTJtU+7N2NB4xRmPWi6xdWZVBZ3qhjmn2n35BViU2UCXwumhNEUi547P0M1eY2tBvi3tHbwCo9EAOOy4rzKJ3SzhSLCvDhgwZ026J8QLvHF2klaJuSAsqn+JfnzMHGD2OuMtNz8TIUWAF52jt9qypW7CHTYmI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=jml48YBo; arc=none smtp.client-ip=209.85.128.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="jml48YBo"
Received: by mail-wm1-f51.google.com with SMTP id 5b1f17b1804b1-4a16bc2278aso11359375e9.1
        for <linux-sunxi@lists.linux.dev>; Mon, 12 Oct 2026 03:09:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791799777; x=1792404577; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=bSIEEiVdbd5GTxTHiyeMgIrG8fJXeKWJLeUgPGtIm2c=;
        b=jml48YBocEOARgiNqBptGZKjW6ACeqrrcbF1NQCp6HNiHUz2Ct5/n729X2COxYmfmK
         wBRebJOtcyYKBz7FXXJtBNZbAlKHKrp7esJyEYcVDAndc5AapPCp57uWMp1NW6UzETH8
         1Nxbz+O6OwTPjaxRjtjq6vRManNf0UU4IUXHzATXaJzPs7MIDmOaF3wcTLJhVdplUyL8
         bD/anrA683T+Ne/g1eiNClsIutfDL4Ta4Xz0O6Z7nisfVq8sfbqvGJrcYn48e+9qsLnK
         nTK6653VsqjgOn00UadMGgvv4+uRLebFFtliLOL8xEJMzwJI6oXiSGgnoE/O49qu6p2r
         qAaw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791799777; x=1792404577;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=bSIEEiVdbd5GTxTHiyeMgIrG8fJXeKWJLeUgPGtIm2c=;
        b=qsFP1zgj+esBMPA8f1dqJyP/fFej93JiaC9xl0EAnu5auiaGVX+RmUzSBoOk4e7zSf
         ZVBrkktqoRC42EXLWKjb8tGhX6SNRDeUNiub15se0BzHWtEpDFOqeMZGssUbDeiTENfB
         YOGuEmMcuE2UNzNZKuuqr/hG47ttQJbxBbnpmCnrgSjo0zpiK87b9sh0RKcj6BNyBiME
         YMSHvl6kl5gBpXc5TpjRWshIo3cJeHXWj5VVYdafTZ3KYZ2fNRVuzKsYJrpXepD3VMx4
         vL9T6I8FH6Qp3ASnaXZTZ81HIq8AdzRzlIumIgX8FDoEe8vujp24LXJznGnrUawhnR1P
         gmRQ==
X-Forwarded-Encrypted: i=1; AKwUvBxWcHFhRJ51KUoMXuchgZVXRwrxS4oLCYyUrT9ada4BKlaJJ5Q8mNrwoNCrjjHyCEwJD2Yk8UYY2XkivQ==@lists.linux.dev
X-Gm-Message-State: AFq9FYJnLwL2J19sqOyAysVi4E8Lag+6aO9Cve3N3xvIMmg+wykryA1L
	RHNnghqEa5xdGdBjCZiXTfHL7yVO3Gwc6gILk5IM5j7yQHlmdwLGti9J
X-Gm-Gg: AYBFou3gJ0QLARs+0+2OSuL13gb4MG98HP780K/QTgiL7mYMAl5VRj/IuYBFldpF3fu
	0yLq7SabQcQonq0OJNzyLcpNlNM4A57knC4wKND4aZExg2+w28dsNn567uzJOAiaXjfZz5s15XV
	+ynORj2P2TcxBqYufZcVcTSUcDp2+akgrhjJzD/niZfRRB3iZAURzQFG3SAKgeq4ktAbeqMbbGe
	LSBX2Dv+WJ/xCVmgzbUH6ECpss3msNIJtE+pIKDFGAtMISzeflL37AffTNGCQck67NyQ169Ag9h
	HM6vRTYWL3a4/1emD1fUDTVHgM+/8bFPc6u+AZWACI3xvpRhNCsBjrbSnRgk1qLKvd+T0vUpvYD
	5T4gQ+k1HVjflrKtvLFoKpje8/MH5+mU/NPFdoKXvCNthCL+DBHj/oclSRsdFcUthTN1lmWcrXi
	5drFZfN7BuPjPxW8JY6O4/TL2EB8oWLbpXuUSdhHSzvC1Acd0rPYAySeu+/Y2ZoLPJ4RW1vDHCG
	+M8KlZxoCTEJ1B+97FSF5Ctd21iCmMl
X-Received: by 2002:a05:600c:6290:b0:4a1:813f:2a61 with SMTP id 5b1f17b1804b1-4a18e4ad518mr163049805e9.15.1791799777253;
        Mon, 12 Oct 2026 03:09:37 -0700 (PDT)
Received: from debian (ip-78-137-176-146.broadband.digiweb.ie. [78.137.176.146])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a192d3efb6sm166229885e9.1.2026.10.12.03.09.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 12 Oct 2026 03:09:36 -0700 (PDT)
From: Pablo Mazzini <pmazzini@gmail.com>
To: Alexandre Belloni <alexandre.belloni@bootlin.com>,
	Chen-Yu Tsai <wens@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Maxime Ripard <mripard@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Samuel Holland <samuel@sholland.org>
Cc: Pablo Mazzini <pmazzini@gmail.com>,
	Andre Przywara <andre.przywara@arm.com>,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-rtc@vger.kernel.org,
	linux-sunxi@lists.linux.dev
Subject: [PATCH v4 05/11] dt-bindings: rtc: sun6i-a31: add Allwinner B288
Date: Mon, 12 Oct 2026 11:08:10 +0100
Message-ID: <20261012100816.331033-6-pmazzini@gmail.com>
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

The B288 RTC wires one alarm interrupt, not two.

Signed-off-by: Pablo Mazzini <pmazzini@gmail.com>
Acked-by: Rob Herring (Arm) <robh@kernel.org>
---
 .../devicetree/bindings/rtc/allwinner,sun6i-a31-rtc.yaml       | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/Documentation/devicetree/bindings/rtc/allwinner,sun6i-a31-rtc.yaml b/Documentation/devicetree/bindings/rtc/allwinner,sun6i-a31-rtc.yaml
index f2b91186ed37..ebe35f893f8c 100644
--- a/Documentation/devicetree/bindings/rtc/allwinner,sun6i-a31-rtc.yaml
+++ b/Documentation/devicetree/bindings/rtc/allwinner,sun6i-a31-rtc.yaml
@@ -19,6 +19,7 @@ properties:
       - enum:
           - allwinner,sun6i-a31-rtc
           - allwinner,sun8i-a23-rtc
+          - allwinner,sun8i-b288-rtc
           - allwinner,sun8i-h3-rtc
           - allwinner,sun8i-r40-rtc
           - allwinner,sun8i-v3-rtc
@@ -82,6 +83,7 @@ allOf:
           contains:
             enum:
               - allwinner,sun8i-a23-rtc
+              - allwinner,sun8i-b288-rtc
               - allwinner,sun8i-r40-rtc
               - allwinner,sun8i-v3-rtc
 
@@ -162,6 +164,7 @@ allOf:
         compatible:
           contains:
             enum:
+              - allwinner,sun8i-b288-rtc
               - allwinner,sun8i-r40-rtc
               - allwinner,sun50i-h616-rtc
               - allwinner,sun50i-r329-rtc
-- 
2.52.0

