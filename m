Received: from mail-ed1-f54.google.com (mail-ed1-f54.google.com [209.85.208.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E6B7F272E6E
	for <linux-sunxi@lists.linux.dev>; Sun, 12 Oct 2025 19:23:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760297024; cv=none; b=bfGHHUWf00WOYdriAaDs8xoaNqH34ML+in/ENbCWFw9EhatYoj31pK8lKe1nQlCG3rCNvAEt4UbTXPeA2uPGq15N7nRHa3tNCVrhrzRhMQytqzBwQR680zWw8v1tSh1tu7pg4iLGgko+PKwhcANN1gxiOsMmbWvJ1fYKlo/kymE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760297024; c=relaxed/simple;
	bh=QfNARh4pPe+cdZZuy3yeIiaQzdxv6g6o5G8d6KVVAlE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=NxmrPvuPrZgOnQJCFmIl6ul+hbXXHiajztNtAqbOAiOU1c3ZNRn4DNthErgg7yqmfUr/66G6Pa4q+UV2GTx5f2wyxt2qnFic0TJU0gOR60rZ82ZxuMTUUhgnAzSRqzcdeU/vXsWfHjwZWaZXxtTfg+AKbWjFnJp1dPjG/U97BZ4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=fOc7FSiq; arc=none smtp.client-ip=209.85.208.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="fOc7FSiq"
Received: by mail-ed1-f54.google.com with SMTP id 4fb4d7f45d1cf-639e34ffa69so5473770a12.3
        for <linux-sunxi@lists.linux.dev>; Sun, 12 Oct 2025 12:23:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1760297021; x=1760901821; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ftu6zu8GSme2+XDOtZSOO4FVxV/p+JAxG+4qy5/uDJg=;
        b=fOc7FSiqe3AsDdawvjLMddslE7sh4DRK5hKRvaoiSYsIo0OlueB3ooB5pKpIe2X63k
         hXTtNwF1+JFg5AZ6M4sDfRNOQ1/ym4Un0lWt2bEHJY8u5vEG9rSUtUOoD+FkRFEU//Yn
         pNeP+etDH4JiNlnZ0xf9WRrBnLUi+PToY81bUSuW/gWeX2dpktWKBu4mH1dtQcwIuIER
         tj1ApoXkUqMEgQt8h2qJxSA4CTX6xeXANU2pPutH/rEOoCCabljBnApVapssD+4oPk6J
         Y+5i146jUrtLjF/3cQPbEGG91/CSpIFrXT5koRXqcyQTAEVol5zGOFXnA/GxJzZ81mZ4
         n7uQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760297021; x=1760901821;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ftu6zu8GSme2+XDOtZSOO4FVxV/p+JAxG+4qy5/uDJg=;
        b=vzODqBJxiaErPzplCJSd8dbFzsYhP03zvNwcUEcTYsdh3JdNsehT6cQUrKln7prBky
         2Yy5udC89HT3KEKc5nnDP+Spmn7H3Fx/YWivz9Y1T+eTOhAAMg7lOvTvq8ItWPWCcCRR
         x3JkhufP8KcgtjwleL8O+MX06lIg1a+mp34pGZOJXFiSr5chDcwfJTy8W5knOJvKZ6za
         2qMMh0xzZuaEGzkhyWa/NNy3ZXpv3zUl54m/tYovP7jTt9zR3gCKYzjn3+OV69sWY1GV
         R//0PlHnSXKhuCDcI5tuPybPhP6fk1SaQOOfNWP0TbDa4/7ziK0b01S3j1yVyTJJPu55
         qj8Q==
X-Forwarded-Encrypted: i=1; AJvYcCUcNs/VU4Ohw1B/6mXN/pZakyRB0oiRhsaB41NGypasNUdNUBoWtyUxM7Y6xxE972f6lmmjyR3++eGmwg==@lists.linux.dev
X-Gm-Message-State: AOJu0YxGn4hFPtLT6JPXx/WaI5QvxXOint7B5g79VuIZA2UQ3bjJ/Jsf
	4DufZsmb9dwZ0QADkoS+OnE+H3YIdQlyUuCt3U08eyHYjQ+XgFkZAdzX
X-Gm-Gg: ASbGncsi2xonPnMF/NzFd0QkYqKLshbE0yoj0n+2C6u9t0/ZdxqsXESTTt5qvkiVj2G
	YCFp9H7F+KITPSzFMYCyNF0beVUtfXKRDzLypWAHT0KOXZlPlCMQlj6xs+RwckKz0+1hR2fNvjB
	pHG+gjv1SzYI8teCtyeNj2A8te83PPJ0giys5mNVlJJghGdPwEstRy4dsXu4CPuInH0wIMzukvq
	6uUKiy3unnFhA4OdxIAsY27ERe0B9yiZphhq+kxo/z2wKrsPwE2bDQp+LwW63V5muwMUMrFO9pG
	Pn4zSroSPQXbrIZ7Tudj6TpQgDUkCZhOWHp0W3tZ0rv/+Sbh8AFtPT7hi/6WjXjKDuPPvt+lVht
	X+dnMNDJfN9DRCJXgE5FIpQ7Js8IQAXu7AD+nYjfhO4OI3QAmiXEOcRspilKLYre5edXhut+WtG
	UHe6FpAM8MD7cyTGBJzF1fffyn20BQy4Q=
X-Google-Smtp-Source: AGHT+IG0sfEJIgIhhCJn3/nqxzgHPFNNqWX+VjerNb/aGPJmXt/GeMNgqqdE+ygKI0NpsjQeQpcZAA==
X-Received: by 2002:a17:907:2d22:b0:b49:3ee4:d4a6 with SMTP id a640c23a62f3a-b50aab9d96bmr2151162666b.18.1760297020857;
        Sun, 12 Oct 2025 12:23:40 -0700 (PDT)
Received: from jernej-laptop (178-79-73-218.dynamic.telemach.net. [178.79.73.218])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b55d67d8283sm760176466b.38.2025.10.12.12.23.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 12 Oct 2025 12:23:40 -0700 (PDT)
From: Jernej Skrabec <jernej.skrabec@gmail.com>
To: mripard@kernel.org,
	wens@csie.org
Cc: maarten.lankhorst@linux.intel.com,
	tzimmermann@suse.de,
	airlied@gmail.com,
	simona@ffwll.ch,
	samuel@sholland.org,
	dri-devel@lists.freedesktop.org,
	linux-arm-kernel@lists.infradead.org,
	linux-sunxi@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Jernej Skrabec <jernej.skrabec@gmail.com>
Subject: [PATCH 01/30] drm/sun4i: mixer: Fix up DE33 channel macros
Date: Sun, 12 Oct 2025 21:23:01 +0200
Message-ID: <20251012192330.6903-2-jernej.skrabec@gmail.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20251012192330.6903-1-jernej.skrabec@gmail.com>
References: <20251012192330.6903-1-jernej.skrabec@gmail.com>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Properly define macros. Till now raw numbers and inappropriate macro was
used.

Signed-off-by: Jernej Skrabec <jernej.skrabec@gmail.com>
---
 drivers/gpu/drm/sun4i/sun8i_mixer.h | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/sun4i/sun8i_mixer.h b/drivers/gpu/drm/sun4i/sun8i_mixer.h
index a1c1cbccc654..b5badfa2c997 100644
--- a/drivers/gpu/drm/sun4i/sun8i_mixer.h
+++ b/drivers/gpu/drm/sun4i/sun8i_mixer.h
@@ -39,6 +39,9 @@
 #define DE3_CH_BASE				0x1000
 #define DE3_CH_SIZE				0x0800
 
+#define DE33_CH_BASE				0x1000
+#define DE33_CH_SIZE				0x20000
+
 #define SUN8I_MIXER_BLEND_PIPE_CTL(base)	((base) + 0)
 #define SUN8I_MIXER_BLEND_ATTR_FCOLOR(base, x)	((base) + 0x4 + 0x10 * (x))
 #define SUN8I_MIXER_BLEND_ATTR_INSIZE(base, x)	((base) + 0x8 + 0x10 * (x))
@@ -242,7 +245,7 @@ static inline u32
 sun8i_channel_base(struct sun8i_mixer *mixer, int channel)
 {
 	if (mixer->cfg->de_type == SUN8I_MIXER_DE33)
-		return mixer->cfg->map[channel] * 0x20000 + DE2_CH_SIZE;
+		return DE33_CH_BASE + mixer->cfg->map[channel] * DE33_CH_SIZE;
 	else if (mixer->cfg->de_type == SUN8I_MIXER_DE3)
 		return DE3_CH_BASE + channel * DE3_CH_SIZE;
 	else
-- 
2.51.0

