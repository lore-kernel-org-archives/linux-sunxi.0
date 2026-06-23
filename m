Received: from mail-wr1-f51.google.com (mail-wr1-f51.google.com [209.85.221.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D42073955FD
	for <linux-sunxi@lists.linux.dev>; Tue, 23 Jun 2026 20:48:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782247720; cv=none; b=nHheKMS4HH9ENZw9a5ydRasvWbJrXIVONfgED6ia7QDO/cHkyqynn86fNL5kU5Dgjbu6VGpdt/XTn08lwy/edSXQTz7x9WKFLU/d7C+g7O/sqSkhR/EgcIIuPetK8xvWw/RAck5vBqPyYOe3SaT8o4BwabT1bPwO3EhtJcDS0QQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782247720; c=relaxed/simple;
	bh=7BGgOMqfp64HcLM4LgYBtFJU9OxxhoCE6bY2vD84luI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=WixjLP6rSdJlguc5XdOLPnJ2DtBXP6KD5cJ6O6HEQUTlchrGj/ZzyepHUOU0LZMrpP45sS1s41E47jjB729qa4vDIOz20rQeEReBwWznBfdWpNdPiroqwZymOQtLxHd8Tr/ZcsXr++ka16taWJGsvt8bcBAvk7a3UXCFYGVwLGk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=qo8N9Cuo; arc=none smtp.client-ip=209.85.221.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="qo8N9Cuo"
Received: by mail-wr1-f51.google.com with SMTP id ffacd0b85a97d-462bb734793so203232f8f.1
        for <linux-sunxi@lists.linux.dev>; Tue, 23 Jun 2026 13:48:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1782247717; x=1782852517; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=L+McTmOMLIPUuLLM47k3fHqRzuLTPsVSB+P6EOYjRpc=;
        b=qo8N9CuoXP9/+0GQnU8xKk1BjZKuxjsM7ivvSyUB3ZRzl1hNaEX0pTzFIbChqKd8Cd
         c9biN3hsGxThNhabwNmaZn1qV91RNiMOqeexSsKQ9aSceiqw1spcrvaTukEK0sr8M9x9
         wOGmwmROZ/+7odLgAwKieg/ogR/ypuvEdsgpzCk+sxnyzAN0/no5u+AKxwNiBajPgFE6
         hqJF27B87iGe5tb9goaWB/Is2Bba4ewuanVGQ3JT76zhblbuRl5CGgX574+rHUSAfAIE
         LS8Bmsr8Jw0jG5CB82npdzcVl+8zntxDfeLRRebm8iUqCwghsr+jFcpVzc1j1p0+ieex
         vzfg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782247717; x=1782852517;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=L+McTmOMLIPUuLLM47k3fHqRzuLTPsVSB+P6EOYjRpc=;
        b=f6CY0lf92eI75dbVH0lnZXtdnXv99XyeFILCg5uvKpG8JoSKr2wiT3Zi6Dfq1GIe+z
         +FKsAIQzdvCJ/muF0IDK14gnlR+arfNb61Txq+xBOV5lihvphkKbmJBAAKM1ESAZqZbe
         4RyZw7i4S4pTqqXY7Pb7GOIDUVThwB60JWiMXmuG3PV0kQs4lFg+jHhUQf5UZMPy+tuH
         CAAG8hXelvsi8+vylHSfioHgUNw8tCz6Yvevps3vwjfN38zSc1xPToTqKxliRCLhySyp
         5CUxDwzUap/sPlbtAY5rA695EANtdN1v1AHtzaDvdOUKLeo+hcNP1ae37AEPqvf/la3L
         oAcQ==
X-Forwarded-Encrypted: i=1; AHgh+RqVb2iVz3Dun++GnglQjrkb7F8FJLN2qrGYaCACs2U6MRNN+4t1e7qx8lBed/5n7wbZQiaotLHnlqyDQw==@lists.linux.dev
X-Gm-Message-State: AOJu0Ywi7Lc+3VSaLGSXxbtFT2fmpKB+2F4Y5fJT9mCn9HJfVRVuDUr8
	zsqQbUgUewxLMoHOzKZbJOQMDDGlckkXlxC7eYYnhmHx3vb/QpM/F/Ai
X-Gm-Gg: AfdE7cn6vo4TyK5e58rBs1mItZhRPRhJaVu0wRE8LlKN1EouNhe7Zghtnk5abFvPBzU
	Wp0cPY2DQdFPnAh2nOfTqDK5cQV+7YflhbWPrpzG3rN4yeELreS0zdP9Fnu2kOkfRDF+MQzWLcJ
	ZE1cgIHWFNBc+7AeFmv++gdwArYpnpmcT//vmOF0IBerDsnZnmoZQfj/b+qXo9Ze3/WfrslTl+p
	2ByrnXrSerdex+sD/mGrbYflctj7Q4u23z+62h2d5GBmJ+/LOxGHShMgwuCBHRpcSlzfuI0HO4n
	+o29KjRmpnYy2jzlZJ51A263M5fgwgYozlF5HSutf85Xs9i3RKecPqO1aj2H8QBsbquAnOGdXwI
	Mp+rrc8fdOvvU8X/kAwoAxJQcVCBFOqC6auP4uI9s6Whd0OVlbX+VXizeig45Av2I8abi6qfo9B
	f/LAsUok2zww8Y4voXOFUMBULZt2InCwIUPswYpApmgw==
X-Received: by 2002:a05:6000:40e1:b0:460:3233:beee with SMTP id ffacd0b85a97d-4666358161amr26055694f8f.42.1782247717200;
        Tue, 23 Jun 2026 13:48:37 -0700 (PDT)
Received: from localhost.localdomain ([2a02:1210:8642:2b00:82ee:73ff:feb8:99e3])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-46c1e840f80sm351996f8f.6.2026.06.23.13.48.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 23 Jun 2026 13:48:36 -0700 (PDT)
From: Alexander Sverdlin <alexander.sverdlin@gmail.com>
To: linux-arm-kernel@lists.infradead.org,
	linux-sunxi@lists.linux.dev
Cc: Alexander Sverdlin <alexander.sverdlin@gmail.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Chen-Yu Tsai <wens@kernel.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Samuel Holland <samuel@sholland.org>,
	Hans de Goede <hansg@kernel.org>,
	Dmitry Torokhov <dmitry.torokhov@gmail.com>,
	Andre Przywara <andre.przywara@arm.com>,
	Jun Yan <jerrysteve1101@gmail.com>,
	Lukas Schmid <lukas.schmid@netcube.li>,
	=?UTF-8?q?J=2E=20Neusch=C3=A4fer?= <j.ne@posteo.net>,
	Eric Biggers <ebiggers@kernel.org>,
	Michal Simek <michal.simek@amd.com>,
	Luca Weiss <luca@lucaweiss.eu>,
	Sven Peter <sven@kernel.org>,
	Maxime Ripard <mripard@kernel.org>,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-input@vger.kernel.org
Subject: [PATCH v5 1/6] arm64: defconfig: Enable Allwinner LRADC input driver
Date: Tue, 23 Jun 2026 22:48:13 +0200
Message-ID: <20260623204824.691832-2-alexander.sverdlin@gmail.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260623204824.691832-1-alexander.sverdlin@gmail.com>
References: <20260623204824.691832-1-alexander.sverdlin@gmail.com>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Enable Allwinner LRADC input driver as module to support buttons on Baijie
HelperBoard A133.

Acked-by: Jernej Skrabec <jernej.skrabec@gmail.com>
Signed-off-by: Alexander Sverdlin <alexander.sverdlin@gmail.com>
---
Changelog:
v4-v5:
- no changes
v3:
- new patch

 arch/arm64/configs/defconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm64/configs/defconfig b/arch/arm64/configs/defconfig
index 654a102cb5bc..c267f0906460 100644
--- a/arch/arm64/configs/defconfig
+++ b/arch/arm64/configs/defconfig
@@ -527,6 +527,7 @@ CONFIG_KEYBOARD_GPIO=y
 CONFIG_KEYBOARD_GPIO_POLLED=m
 CONFIG_KEYBOARD_SNVS_PWRKEY=m
 CONFIG_KEYBOARD_IMX_SC_KEY=m
+CONFIG_KEYBOARD_SUN4I_LRADC=m
 CONFIG_KEYBOARD_CROS_EC=y
 CONFIG_KEYBOARD_MTK_PMIC=m
 CONFIG_MOUSE_ELAN_I2C=m
-- 
2.54.0

