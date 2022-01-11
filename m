Received: from mail-lf1-f50.google.com (mail-lf1-f50.google.com [209.85.167.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CB2162CA1
	for <linux-sunxi@lists.linux.dev>; Tue, 11 Jan 2022 16:52:08 +0000 (UTC)
Received: by mail-lf1-f50.google.com with SMTP id o15so5447286lfo.11
        for <linux-sunxi@lists.linux.dev>; Tue, 11 Jan 2022 08:52:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=wirenboard-com.20210112.gappssmtp.com; s=20210112;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=LPnKNnGqdiYMMpKq/WA+Z6kNQKG0cNdkH1ROe6l1fFQ=;
        b=2EccJKwdU+Lr3bgd3jeTNPEKrPbLyrii3qqWSBD8m8S/Tlt5BwoOA3/bBp/aV0NzJ7
         btS7ggxa0ROJIrqLjFmyWdqkzO6I2zFMaR6MeGCtS+qubZWsOtFREnBOKkiO/EiG2bXa
         qZRDT8WavfOrdHF+aBw7m3hq81BVNGBEG+3U87XR7K7zeg1fsSDKO2qBikqNnzjP6Xhi
         iP9nI1u+DQydKyM7+czj5XsrILRJaUZjorGbBxW0Vr15RGMmm1WrZLAU3gmXiGYrcjjU
         GZwFjcJyJGXUN49fS4CBVmUOuFamAlCTz+1Eq563xho2ZzlZ97SjhJfISrelD9N6l9kL
         mr+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=LPnKNnGqdiYMMpKq/WA+Z6kNQKG0cNdkH1ROe6l1fFQ=;
        b=oEl40mjgtO92zupRsDQhYziUnNZEA602RpVeJQgG90Ntcvr3e/mWQJnQmiyNf0PlQR
         3FncAjLW1M71L571liHzevCNC35MpJhr65XvYcB6bPXJZm2SO+eblqYow+SjKAryJTF8
         mjidy76RUJXaKW2ugQ2zN+TMn+ScTFo1vhaExD0Hxxk+fQi9tdEskf7X5HOBjrc+Nvt+
         OlCRdnfDypEhd7zVOHUZIIdlsfGWsRaxhiYaS3C33kRDzwn6zErJcKvWqvOEodrBabIk
         6k4Ks0YAW4VkPfJHqCtSO3NjY0vOKjA+ARCoe+9cnsUWdN6/LF+6E1VKiaNYKIvgPOrJ
         QuQQ==
X-Gm-Message-State: AOAM533d4VVCNQumedb7e+dLuMyZPAo78ERWivA3zmJQzsGNEaOIiBCK
	ayG79gHeRp0DU7auSHpUA34t7acdsSv+ww==
X-Google-Smtp-Source: ABdhPJw555q6HIxdUbaCoV1EsYbX+4jhs2TiiO453k+2a4jz6Mw9SyBZjUujc8l2ObV892ZkviCkGQ==
X-Received: by 2002:a2e:9794:: with SMTP id y20mr2567694lji.227.1641919926520;
        Tue, 11 Jan 2022 08:52:06 -0800 (PST)
Received: from boger-laptop.lan (81.5.110.253.dhcp.mipt-telecom.ru. [81.5.110.253])
        by smtp.gmail.com with ESMTPSA id c21sm1386388lfi.95.2022.01.11.08.52.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 11 Jan 2022 08:52:05 -0800 (PST)
From: Evgeny Boger <boger@wirenboard.com>
To: linux-sunxi@lists.linux.dev
Cc: Evgeny Boger <boger@wirenboard.com>,
	linux-arm-kernel@lists.infradead.org,
	Maxime Ripard <mripard@kernel.org>,
	Chen-Yu Tsai <wens@csie.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Yangtao Li <frank@allwinnertech.com>,
	Icenowy Zheng <icenowy@aosc.io>,
	andre.przywara@arm.com
Subject: [PATCH v2 0/1] fix USB host in HS mode on Allwinner H3 and newer
Date: Tue, 11 Jan 2022 19:51:52 +0300
Message-Id: <20220111165153.63632-1-boger@wirenboard.com>
X-Mailer: git-send-email 2.25.1
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This patch makes USB host work reliably in HS mode on Allwinner A40i (R40)
and some other SoCs by fixing the way the internal PHY registers are
written.

Changes in v2:
  As suggested by Andre, I've added the detailed description of the nature
  of the issue. Appart from commit message, nothing is changed compared to
  v1.

Evgeny Boger (1):
  phy: sun4i-usb: fix phy write on H3 and newer

 drivers/phy/allwinner/phy-sun4i-usb.c | 44 ++++++++++++++++++++++++---
 1 file changed, 39 insertions(+), 5 deletions(-)

-- 
2.25.1
