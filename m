Received: from smtp-relay-canonical-1.canonical.com (smtp-relay-canonical-1.canonical.com [185.125.188.121])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8DF8F72
	for <linux-sunxi@lists.linux.dev>; Thu, 19 Aug 2021 18:23:25 +0000 (UTC)
Received: from mail-ed1-f71.google.com (mail-ed1-f71.google.com [209.85.208.71])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-relay-canonical-1.canonical.com (Postfix) with ESMTPS id 1B993411F5
	for <linux-sunxi@lists.linux.dev>; Thu, 19 Aug 2021 18:23:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
	s=20210705; t=1629397398;
	bh=wXv+g9MByShu0tv6L5ordxjhpc+MsSSwpZ4DgfMhl7E=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version;
	b=Tw/6DYmDUAqjWQoln6W/lijlr4fSV11mi5RSxq0YJxy0pf2MChX2rXYBko45p6zM+
	 h8YlUWkFf7VmcCUEvvU5BkNt+yzxoB0K/7lp0Weitx8YCuaunM6ZGrHknWeiKpkVZV
	 vclaqR3a31eU3zxBZOfJ8QFT+8HAdCFbr8vvVBf2cFCXhV9djWBVM1XE6xHS9ODUqc
	 5ujGYPoIfdXuJG9Sx2AhHcQFfqEULuWr3UOOR5Rxhg10GKvRvaEO4u3Gkpuo34jVoE
	 yfGzv/BkhrWG4toapGNI4OWbZfbmnBngzCzO7y016rOUqoCBnhFNxZXnQfyDSw1Znc
	 bYpe5/Zfh+nXg==
Received: by mail-ed1-f71.google.com with SMTP id x4-20020a50d9c4000000b003bed5199871so3240312edj.14
        for <linux-sunxi@lists.linux.dev>; Thu, 19 Aug 2021 11:23:18 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=wXv+g9MByShu0tv6L5ordxjhpc+MsSSwpZ4DgfMhl7E=;
        b=URYYZXDWP1JqTBGGxjAk+m6GqmlpfTN/+IvF0TbXU0zhHu5ygHjtPOPEYlpEUHWDFp
         Hotq3Bf1XHLDNUcyN8fK+Xj2Ch4kxg0XGwaelKbnjoOBLNfSFLrEU0WbFajpLdBcMZX4
         /po7qEttF4YETuqov/QV68XYnDbXgnE+EmN7AOwYSiGBvW2tCQoMeSQDUxb0jx+Dq+qv
         Te7Yi4EKYWX1WwS3sdo1NR3u5jlsxQPA0jMgsbKIVd4uSyF4rH60YTlYJ2a4SJjRjPl8
         iOSYkMvQeEr8XDPk9V/nWT9jIHnG9ghk1D4ZtqYDFAPSgJxlL9JKG6ogbItHX9xgBugw
         zqKw==
X-Gm-Message-State: AOAM53004p1cEgBiOf1xm8iEvV6nQmjikaNJ0G4DMHcr0I/z5AASx0TN
	PlXnJlm7JRka1Izh6pYHXuLrIdwSwPaLkNVNBvyhM5EOap1Zfbv9yeUKunPp7Q9aHYRolA9Ayqs
	KArUGWjKGNfwNHYNXXe6XShzRYqAEumXUCYwiSdVg
X-Received: by 2002:a17:906:b286:: with SMTP id q6mr17000387ejz.120.1629397397747;
        Thu, 19 Aug 2021 11:23:17 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwrG9+2tCoz8kPE9jEeoLuD0BBvKPHrr35QvvOIc37v4HQRU5a/njfqp1KeCSZm/azbfQSHeg==
X-Received: by 2002:a17:906:b286:: with SMTP id q6mr17000377ejz.120.1629397397609;
        Thu, 19 Aug 2021 11:23:17 -0700 (PDT)
Received: from localhost.localdomain ([86.32.42.198])
        by smtp.gmail.com with ESMTPSA id c28sm1602113ejc.102.2021.08.19.11.23.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 19 Aug 2021 11:23:17 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
To: Rob Herring <robh+dt@kernel.org>,
	Maxime Ripard <mripard@kernel.org>,
	Chen-Yu Tsai <wens@csie.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Heiko Stuebner <heiko@sntech.de>,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-sunxi@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	linux-rockchip@lists.infradead.org
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
Subject: [PATCH 1/2] arm64: dts: allwinner: a64: align operating-points table name with dtschema
Date: Thu, 19 Aug 2021 20:23:10 +0200
Message-Id: <20210819182311.223443-1-krzysztof.kozlowski@canonical.com>
X-Mailer: git-send-email 2.30.2
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Align the name of operating-points node to dtschema to fix warnings like:

  arch/arm64/boot/dts/allwinner/sun50i-a64-bananapi-m64.dt.yaml:
    opp_table0: $nodename:0: 'opp_table0' does not match '^opp-table(-[a-z0-9]+)?$'

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
---
 arch/arm64/boot/dts/allwinner/sun50i-a64-cpu-opp.dtsi | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/allwinner/sun50i-a64-cpu-opp.dtsi b/arch/arm64/boot/dts/allwinner/sun50i-a64-cpu-opp.dtsi
index 578c37490d90..d55248bb8ddd 100644
--- a/arch/arm64/boot/dts/allwinner/sun50i-a64-cpu-opp.dtsi
+++ b/arch/arm64/boot/dts/allwinner/sun50i-a64-cpu-opp.dtsi
@@ -4,7 +4,7 @@
  */
 
 / {
-	cpu0_opp_table: opp_table0 {
+	cpu0_opp_table: opp-table-0 {
 		compatible = "operating-points-v2";
 		opp-shared;
 
-- 
2.30.2

