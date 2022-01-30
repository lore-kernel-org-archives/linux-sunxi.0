Received: from mail-qt1-f175.google.com (mail-qt1-f175.google.com [209.85.160.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 849952CA8
	for <linux-sunxi@lists.linux.dev>; Sun, 30 Jan 2022 22:03:32 +0000 (UTC)
Received: by mail-qt1-f175.google.com with SMTP id h25so9099659qtm.1
        for <linux-sunxi@lists.linux.dev>; Sun, 30 Jan 2022 14:03:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=6qiePQaFCn1ZGPCNmG2bQohlbkcHJHVngAid2qwzesM=;
        b=XOquuE6+leFupXRFTrasECGzeQsYzTYPp3l4osaT5HiTo6neKNQp6wwKb1xG9FW+YE
         FHvQcgfmeHmuqfXuUAqMKMsS3Qe8MNRSliJ0Ddmr7SwAfNtnFWeNXfXTA2CIdt8CYdQ4
         bkDvIDL/tLDNb2oCGYTZHbRnNlzJ/+psTq7Rzkltr70MHCjk+Du4zPuvq1XRi1HIyUjj
         9MbvgnqQ9Ryb3AM8DYPCukpYRZWii5r/ye64Yw7P1B1n71Hajew0Qno4YWy6Igx+sKUC
         Kj1X3nW3ca/TOc7Bwdm5foMCwc4i1jHlQa+WAOyye8QZxxCia/kGvU46XeD6+CBViuhC
         hdbg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=6qiePQaFCn1ZGPCNmG2bQohlbkcHJHVngAid2qwzesM=;
        b=5EX7GGYBPktWT/KaD/wtg8noDgXg6x0Nb/a+TiOr63TTr3/W1D5vMJMotglx23Cmri
         FMGjqgK2SibGQFIg7DchVKMIS9TkFyhKOKmNoercg/RNU5sqWAHJ45kMWwM0YfjYydP7
         XWIp5xgSLX0klhMU6cEDmyI8ZtKo/82RQo357SKDmuxWIT6i04rvR2bZ9nDhhlnSksfr
         9G7uGfd/lZcI3LgbFY/wGMXbFBj8sSnQm013zcfNyA07rMfvEm4O0w1hUFrtmJ5VycLb
         I3ja9EwP8gnj+nsMynHg3Ze+d56KIYlv9MNQcdfn+h8GPH4RGq20AstjrxjaeAzQ0K4e
         CFuw==
X-Gm-Message-State: AOAM5304+oWVNy/YNzUU1nWDJH+tXRLYhpxPGDsYRcEe+4zwrCeW9GGf
	3E//ZQmp3PnWXj6TIUfLMPQK5EFUNp8=
X-Google-Smtp-Source: ABdhPJxMJhxrMrTxwGFCEmXjNwICsOJcPiNWFbd5jxVwXQ71fDUJraFuqlS2DMNlQEn/sqwTs72a8Q==
X-Received: by 2002:a05:622a:118b:: with SMTP id m11mr2448324qtk.96.1643580211596;
        Sun, 30 Jan 2022 14:03:31 -0800 (PST)
Received: from jesse-desktop.jtp-bos.lab (146-115-144-188.s4282.c3-0.nwt-cbr1.sbo-nwt.ma.cable.rcncustomer.com. [146.115.144.188])
        by smtp.gmail.com with ESMTPSA id h12sm7556651qkp.129.2022.01.30.14.03.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 30 Jan 2022 14:03:31 -0800 (PST)
From: Jesse Taube <mr.bossman075@gmail.com>
X-Google-Original-From: Jesse Taube <Mr.Bossman075@gmail.com>
To: devicetree@vger.kernel.org
Cc: robh+dt@kernel.org,
	Mr.Bossman075@gmail.com,
	andre.przywara@arm.com,
	linux-sunxi@lists.linux.dev,
	mripard@kernel.org,
	linux-arm-kernel@lists.infradead.org
Subject: [PATCH v2 4/4] ARM: dts: suniv: Enable mmc for f1c100s.
Date: Sun, 30 Jan 2022 17:03:25 -0500
Message-Id: <20220130220325.1983918-4-Mr.Bossman075@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220130220325.1983918-1-Mr.Bossman075@gmail.com>
References: <20220130220325.1983918-1-Mr.Bossman075@gmail.com>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Enable mmc0 in f1c100s-licheepi-nano device tree.

Signed-off-by: Jesse Taube <Mr.Bossman075@gmail.com>
---
V1 -> V2:
* New patch
---
 arch/arm/boot/dts/suniv-f1c100s-licheepi-nano.dts | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/arch/arm/boot/dts/suniv-f1c100s-licheepi-nano.dts b/arch/arm/boot/dts/suniv-f1c100s-licheepi-nano.dts
index a1154e6c7cb5..c856a6a20dc8 100644
--- a/arch/arm/boot/dts/suniv-f1c100s-licheepi-nano.dts
+++ b/arch/arm/boot/dts/suniv-f1c100s-licheepi-nano.dts
@@ -24,3 +24,9 @@ &uart0 {
 	pinctrl-0 = <&uart0_pe_pins>;
 	status = "okay";
 };
+
+&mmc0 {
+	bus-width = <4>;
+	broken-cd;
+	status = "okay";
+};
-- 
2.34.1

