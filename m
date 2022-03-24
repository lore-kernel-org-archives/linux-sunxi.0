Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com [209.85.128.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6E7AE1FA1
	for <linux-sunxi@lists.linux.dev>; Thu, 24 Mar 2022 14:42:40 +0000 (UTC)
Received: by mail-wm1-f49.google.com with SMTP id r64so2851822wmr.4
        for <linux-sunxi@lists.linux.dev>; Thu, 24 Mar 2022 07:42:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20210112.gappssmtp.com; s=20210112;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=RUuYp2gzZTfveRrYj1nKJKJ6GLr04No5LqGCeqkgp50=;
        b=G9HidbaMnDHtTrEAhAkiDwkyMIMMc6Wqcu/xpKqMNAqZgScFmSCAILoCtXpISK+Hhy
         uB+8YBCUwdxf1Gocu8dCsTLDhaqkZGMeh6nNJ3sUFCCJImFnDwOyBw6dRyGd8Rm8I3OK
         4rKkIdOoe9qcnCYK25u26XittRZwpnKn4rAlusYwV9HlRFHoau53kWOf/+m6xWfwxB/h
         zQ54w0wxyEcRcwkFJuJ+1mJTTVlkBlhHn7TzrxHuLg+m4FtaPlh57mFRtuAS7w7hH6M9
         cbq8IvAUXGMjZvK+w4GvQp66umUGHCpUGcbSgAPAW4awO2p2dX6wGm5kdQWdDSl4axza
         EZmA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=RUuYp2gzZTfveRrYj1nKJKJ6GLr04No5LqGCeqkgp50=;
        b=oeq3uaKkJNyQGdGWyENpJqkQ+oJnX1DQqiJ8YqwqEYUNdypZNGfpxtvTj7qQ0TLyY/
         8Rx94ZBlmYdIGpHvFJvKIqJ0/eNvsn2cU1ZAGvZviPjRfhgGK6tHEa4N48YqxvqGCFd8
         9ydHt25gmKBP62vWlzzgfS2PR6BmnNtbv3CvAN447DX22z4sMUd6j6gQPQUrqh13Y/Uv
         A7Ua5IOpPKiE96Y7cHxsuXchYkhW/SyDtUIFJixFynsEAiPU7KWrLIN+49LFJGPNw0vS
         w+CvXqRbw2maouLSjF/sy6cyD2pPeHjLekMyDyUD7v5ARHX8BDd2gGZkHcEjyMg1dOnJ
         sMiA==
X-Gm-Message-State: AOAM532MHvC0BL5RALgB9gNrRLcfUlb9u+bnpRxnCmyt75UYo+NbcYLM
	2vcqn59frta4pjEsW5WT1rOHzA==
X-Google-Smtp-Source: ABdhPJw3kEFmgdFvOYqPEE/cnML2UreW9i+I5UewFAmsjCiGfAtVJ0zEiql/LajWmccl86QQnyLLPQ==
X-Received: by 2002:a05:600c:4608:b0:38c:6ba3:1c9f with SMTP id m8-20020a05600c460800b0038c6ba31c9fmr14542211wmo.39.1648132958693;
        Thu, 24 Mar 2022 07:42:38 -0700 (PDT)
Received: from localhost.localdomain (laubervilliers-658-1-213-31.w90-63.abo.wanadoo.fr. [90.63.244.31])
        by smtp.googlemail.com with ESMTPSA id r15-20020a5d6c6f000000b002040552e88esm3273175wrz.29.2022.03.24.07.42.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 24 Mar 2022 07:42:38 -0700 (PDT)
From: Corentin Labbe <clabbe@baylibre.com>
To: davem@davemloft.net,
	herbert@gondor.apana.org.au,
	jernej.skrabec@gmail.com,
	krzk+dt@kernel.org,
	robh+dt@kernel.org,
	samuel@sholland.org,
	wens@csie.org
Cc: devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-crypto@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-sunxi@lists.linux.dev,
	Corentin Labbe <clabbe@baylibre.com>
Subject: [PATCH] dt-bindings: crypto: sun8i-ce: remove extra line
Date: Thu, 24 Mar 2022 14:42:33 +0000
Message-Id: <20220324144233.1119495-1-clabbe@baylibre.com>
X-Mailer: git-send-email 2.25.1
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

yamllint complains about this extra line.

Signed-off-by: Corentin Labbe <clabbe@baylibre.com>
---
 Documentation/devicetree/bindings/crypto/allwinner,sun8i-ce.yaml | 1 -
 1 file changed, 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/crypto/allwinner,sun8i-ce.yaml b/Documentation/devicetree/bindings/crypto/allwinner,sun8i-ce.yaml
index 00648f9d9278..026a9f9e1aeb 100644
--- a/Documentation/devicetree/bindings/crypto/allwinner,sun8i-ce.yaml
+++ b/Documentation/devicetree/bindings/crypto/allwinner,sun8i-ce.yaml
@@ -82,4 +82,3 @@ examples:
       clock-names = "bus", "mod";
       resets = <&ccu RST_BUS_CE>;
     };
-
-- 
2.34.1

