Received: from mail-wr1-f48.google.com (mail-wr1-f48.google.com [209.85.221.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C98A423AA
	for <linux-sunxi@lists.linux.dev>; Wed, 18 May 2022 20:09:52 +0000 (UTC)
Received: by mail-wr1-f48.google.com with SMTP id h14so4176490wrc.6
        for <linux-sunxi@lists.linux.dev>; Wed, 18 May 2022 13:09:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20210112.gappssmtp.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=OAGkT1M5jMR9soataqZ/aDlCf+slpduEKHamzxDek+k=;
        b=nWSEVQAcxxJIiQkZxG8xgSo5vu5I9ZUHiImr8EADEL8kSkFbfVM8Z+pM6spbJA7xIS
         x2EBkxIl74cC6FLEssPgc6edf8Kk1rhUVcEReBqLBiYH601c150gPmU22b3TeXotis0S
         6cJ1RtsIKomQ414rySZaGUyuVcbJcHgmi3M/ScbiW0g+tnr3uixJjSARK+khNPx0Wu20
         Da19MgE010SDvuxpfHelPqh9BNATH8CsxheYNWGZyFBmqLo5hAUbGzsbTfEHHRc2xjNg
         InDxaIl+0rtY3n4ABjaBp9sji3I8l4Y0Fcw0mfILYcoSgry7sN6ziRIUQntFfiJ/YKmO
         OQrw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=OAGkT1M5jMR9soataqZ/aDlCf+slpduEKHamzxDek+k=;
        b=UikxpUmaqAVwEPhe+LqoZmINlFPsGs0B8yXKxqnMuxY1lGZYczolh9nkze/F+rjYqG
         XjIis6RRpG08tuYx6FRiJczDU7Mo0dKe0gKtqTByDP6m0EZqQCkdH8Chw547BipWwNaP
         YVze6ua1EeqDRppdb/QwErgBhjfkcSEoK3rsiR/lvxJ3A8aubOBs1SGUK77x3D5dBDOH
         SN+dpz+/F7Sd7AYeyrYXgQS233jJoRUXMN6HD2s1gmYivfs7t+Vkv64cAruVcROGxgkz
         4v/XMkroHsuPwX3m6NQ1Tja0zBdzefMdBmawodPb750cCLQ0Tb8DMhFDOnqPndzVbRd6
         FVrQ==
X-Gm-Message-State: AOAM531UrCyxlh3ASYvbHndwLt2a/4j2/LGh7fdsSG+CFu/6kHqC3mmd
	NNk0BIB0TLcrFHhR9cnqdLMBmg==
X-Google-Smtp-Source: ABdhPJx7027jt1OtEzgemX8nNGTw2DPHXeDkAAtNb+diLtz+l8F2qMFU1DeU5NN/nWByXPmhBkliSw==
X-Received: by 2002:a5d:4741:0:b0:20d:2a5:6b2d with SMTP id o1-20020a5d4741000000b0020d02a56b2dmr1161260wrs.100.1652904591171;
        Wed, 18 May 2022 13:09:51 -0700 (PDT)
Received: from localhost.localdomain (laubervilliers-658-1-213-31.w90-63.abo.wanadoo.fr. [90.63.244.31])
        by smtp.googlemail.com with ESMTPSA id o23-20020a05600c511700b0039456c00ba7sm6859281wms.1.2022.05.18.13.09.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 May 2022 13:09:50 -0700 (PDT)
From: Corentin Labbe <clabbe@baylibre.com>
To: andrew@lunn.ch,
	broonie@kernel.org,
	calvin.johnson@oss.nxp.com,
	davem@davemloft.net,
	edumazet@google.com,
	hkallweit1@gmail.com,
	jernej.skrabec@gmail.com,
	krzysztof.kozlowski+dt@linaro.org,
	kuba@kernel.org,
	lgirdwood@gmail.com,
	linux@armlinux.org.uk,
	pabeni@redhat.com,
	robh+dt@kernel.org,
	samuel@sholland.org,
	wens@csie.org
Cc: devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-sunxi@lists.linux.dev,
	netdev@vger.kernel.org,
	Corentin Labbe <clabbe@baylibre.com>
Subject: [PATCH v2 4/5] dt-bindings: net: Add documentation for optional regulators
Date: Wed, 18 May 2022 20:09:38 +0000
Message-Id: <20220518200939.689308-5-clabbe@baylibre.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220518200939.689308-1-clabbe@baylibre.com>
References: <20220518200939.689308-1-clabbe@baylibre.com>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add entries for the new optional regulators.

Signed-off-by: Corentin Labbe <clabbe@baylibre.com>
---
 Documentation/devicetree/bindings/net/ethernet-phy.yaml | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/Documentation/devicetree/bindings/net/ethernet-phy.yaml b/Documentation/devicetree/bindings/net/ethernet-phy.yaml
index ed1415a4381f..bd59e5cc0a55 100644
--- a/Documentation/devicetree/bindings/net/ethernet-phy.yaml
+++ b/Documentation/devicetree/bindings/net/ethernet-phy.yaml
@@ -153,6 +153,15 @@ properties:
       used. The absence of this property indicates the muxers
       should be configured so that the external PHY is used.
 
+  regulators:
+    description:
+       List of phandle to regulators needed for the PHY
+
+  regulator-names:
+    description:
+      List of regulator name strings sorted in the same order as the
+      regulators property.
+
   resets:
     maxItems: 1
 
-- 
2.35.1

