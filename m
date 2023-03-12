Received: from mail-ed1-f51.google.com (mail-ed1-f51.google.com [209.85.208.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 976471FC5
	for <linux-sunxi@lists.linux.dev>; Sun, 12 Mar 2023 13:15:18 +0000 (UTC)
Received: by mail-ed1-f51.google.com with SMTP id o12so38504609edb.9
        for <linux-sunxi@lists.linux.dev>; Sun, 12 Mar 2023 06:15:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1678626917;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=Y4NIviSFBdopEf8zQTdl2J1MRzQXgxaliBaSLt4RpAk=;
        b=H0gAYKteJZspYXhBQb75omimqMlU/3ICKO865cyDwNVHcSV9El2GPK8iBANJpw4WTf
         uSlYknNPoNxmPDr1cayhoMMjioXKbh4JISMQSYYm50XfVL2OKtKt3ELm4uC+ufpuY/Pz
         gV8aFkz2EZowNSm/luHBng1oXIHab6hjItQRMnAuD4l/bXp8VooAIhXV+R2EQbZlhZRz
         yMz6nQ7cZxqoa4ZD77/BpLScxsDjqOyUnep1ya6MNgVSBFInP5yZwunhFzyx+2g9Sy2v
         A3JwbUJBRAAt6rAsKIaqTLYEbHiCCWi641dSnbv4jP8NE3eeKhAU6dR0Rfz/Yxju+0cc
         sgHQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678626917;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Y4NIviSFBdopEf8zQTdl2J1MRzQXgxaliBaSLt4RpAk=;
        b=2PQYfRN0pvPZ9bys8Us2xc0MwYYb18A0mRcYx0ExbC6n779psubjB7PEJC8ZiMPIOl
         Uy9KCfaJtWhVSJ8tbKrUOYEL+RK3KVTv8x6XjimaUcuBvBbNkSpnW69Hjz3/Lbe6nUzc
         4Vu1bkylWuLGHnS/D+p9NA6OSOK0k0KlWr0X60mNTKDx8qhrJ9A2qdK+LRupZy/Mg1gG
         inKjKtczgJZRDRH16Fsww6/aF5YrHVlI3hG+Bpzo6VfiBceYFWyyibWjin5uhO4H4jVI
         qM8L+fIKuoOITYw0Uy7cIiNH/O0FVpygoUo/3Z0HQvgTrEfL75ZgtCqZhtQKc7Dt+k0r
         jRbQ==
X-Gm-Message-State: AO0yUKWYbdSz4xQC7/dg/9/GTYp0adlF7LKl4Zrn9eacI98Ft4j1zv6f
	zJjiv6frgjNm+FfzD6VGWdmPBA==
X-Google-Smtp-Source: AK7set8I4cqRQbCnoLL6lvvu0JefPsaKOI2DGJq/GhcEpkC6BmWIDdihxL2/gFsjsKFFEZdmBfNu3g==
X-Received: by 2002:a17:906:8d86:b0:8f9:ed75:f962 with SMTP id ry6-20020a1709068d8600b008f9ed75f962mr33585228ejc.18.1678626916875;
        Sun, 12 Mar 2023 06:15:16 -0700 (PDT)
Received: from krzk-bin.. ([2a02:810d:15c0:828:d9f6:3e61:beeb:295a])
        by smtp.gmail.com with ESMTPSA id h26-20020a170906399a00b00915d58e56f0sm2223493eje.77.2023.03.12.06.15.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 12 Mar 2023 06:15:16 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To: Dmitry Torokhov <dmitry.torokhov@gmail.com>,
	Ray Jui <rjui@broadcom.com>,
	Scott Branden <sbranden@broadcom.com>,
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>,
	Chen-Yu Tsai <wens@csie.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Samuel Holland <samuel@sholland.org>,
	linux-input@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-sunxi@lists.linux.dev
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: [PATCH 1/4] Input: st-keyscan: drop of_match_ptr for ID table
Date: Sun, 12 Mar 2023 14:15:11 +0100
Message-Id: <20230312131514.351603-1-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

The driver can match only via the DT table so the table should be always
used and the of_match_ptr does not have any sense (this also allows ACPI
matching via PRP0001, even though it might not be relevant here).  This
also fixes !CONFIG_OF error:

  drivers/input/keyboard/st-keyscan.c:251:34: error: ‘keyscan_of_match’ defined but not used [-Werror=unused-const-variable=]

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 drivers/input/keyboard/st-keyscan.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/input/keyboard/st-keyscan.c b/drivers/input/keyboard/st-keyscan.c
index b6e83324f97a..0d27324af809 100644
--- a/drivers/input/keyboard/st-keyscan.c
+++ b/drivers/input/keyboard/st-keyscan.c
@@ -259,7 +259,7 @@ static struct platform_driver keyscan_device_driver = {
 	.driver		= {
 		.name	= "st-keyscan",
 		.pm	= pm_sleep_ptr(&keyscan_dev_pm_ops),
-		.of_match_table = of_match_ptr(keyscan_of_match),
+		.of_match_table = keyscan_of_match,
 	}
 };
 
-- 
2.34.1

