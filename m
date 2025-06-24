Received: from mail-ej1-f46.google.com (mail-ej1-f46.google.com [209.85.218.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EF970298984
	for <linux-sunxi@lists.linux.dev>; Tue, 24 Jun 2025 18:16:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750788983; cv=none; b=HKRfVDaHuzyCRMF+B5YaaQjIyOKeWoh/XH2EfKacfYdWlLqJeXWtt5mlqG1junh3er+ChXQv2R9M9ul97rgKo8EiFn1eMKriPPJVlvCv9JGnhToABhzFdPMN4yE4qLLf0HfLY6Vd5qX+JpEWzR4PU3rfTZB536yZ1HB+s1EworQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750788983; c=relaxed/simple;
	bh=S8bWVrtohU804TFCIPr4aot/z07tET4jFwVUKYqLlZ0=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=UM/3cFYMMz+I9QqI5Nu/KOqNWndj58byOIMsrfKhQ97u1pUwgKSwXL+A2El+6Y2E8cs+oZ/Pf88kgoS4aqTJEzAumIUoDjblBr1D1bExHIaOvDW0QettPqDgNEf+Pb6s6ixe+kjLPQJM+1zjEEHWVOX5nfqNAXozEBR3L8Z/Myo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b=mM7vbQIU; arc=none smtp.client-ip=209.85.218.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b="mM7vbQIU"
Received: by mail-ej1-f46.google.com with SMTP id a640c23a62f3a-ae04d3d63e6so758597866b.2
        for <linux-sunxi@lists.linux.dev>; Tue, 24 Jun 2025 11:16:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1750788977; x=1751393777; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=VnpSnkfgkUADh3xBII6BavGc953e/khu2q4B6DDX498=;
        b=mM7vbQIUGZElOYaEoe6gDeFwxrE0urFaftjsdHMmQS4WMI6zQdaXcWWWUD6YRdp8N7
         AJCI33j2NorEKEu9pY+t2tFY2rd8ElCpMxlI8Y2Lt58uuPhfpfmAvhX+sv+PXbWPRuvs
         IBJwGEUBOQb7x0PcvimfetZOgaI0d6YYBEoPaVLiObmzTYQKMlnbpINSsT3pI3k1r+eq
         S+e3KlSVvB4rO2WepBymViI50rJjvh+M/kF/Oo5kzvPEmdwy5Hu5QqKufxp0MaaZe8FP
         s+gj2JuMIXgmJMoKvzaLIP9oadHV9T+n/dpaf1j1df5HJiLN//2WTz8CusbHMxJt/k7n
         iYeQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750788977; x=1751393777;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=VnpSnkfgkUADh3xBII6BavGc953e/khu2q4B6DDX498=;
        b=C5MoeuPHckOJTrzAxQacnHiIaoHwMvwQ1O3674O8WikEh2g/yL95KpmkmzSxjwJdIR
         IzLkc5HOeOejxnr3a6pwcXmuWIUHUYNaVp7H66NiDwQVq8mkS5lsc5OOpDCPFBAOwW6N
         X1YKeZEFMzHLn4rZFdO54UM6Tjs7/13yQrr/8lMXmDDA5vaa7tXeTVglgR4dXajtDJwF
         JK5+2cZUc9jGCls7cgkmUjoCkJcRCNpbFFvp31PQ2kamvyg+l1yssboe0LQaNKML/XPd
         wDUKm7jTeRcQmFjtSX2/K/hRQgcT4FGXULC9xTPfqX7Afsx4vEs8JI6bRv3lO6rkv8ys
         XF8Q==
X-Forwarded-Encrypted: i=1; AJvYcCWng4JvIhikfON3792hXGPRWCqJI0IxkE2oj2PBkVBlEXRXB3XT8peRbWP+MHBMX+LGKxMw8AxYted2WQ==@lists.linux.dev
X-Gm-Message-State: AOJu0Ywo/Qv0Hh90VtObLJ3vi0VIO3OqN7R49pVo73gnA6vOljNKxGvd
	kxv7+x5RQnGpbmFf3IIuxaniTzRARWw23g78U8QdPSu7eKm9qGAGbB/B8LoKK1ILMcBroxFPCnH
	lctyP
X-Gm-Gg: ASbGnctHLcwbz/IHwbH8EuYNz7oE0ExE7vdUDKd2mFnhQWmuqws9aX9ArF1O2r/7mec
	G0KLzZgdZXYRp9+NNL+F1YTflW6OflkhMQUqvYccEmUFJ4RWupi9Fsu26tQbkjETQruE83p69X1
	uWyvxn/OMlrFlWfal44IXikfjKNuNWKEmm/jeigVpiWI0bbbTh4KOpioCyaOWzaYCqW1mkX+wVv
	6h1bItPz3qA1RpR3wlzNYRsBudjmhMb1drMeI843ClRwUtKuR/5cRu8GXQMUHJv0f6piJijqMma
	95A6xdf909Be231uqGXuu4lV4/IpQbnKXVochZINnR/Hb3AXqCedm/zqcjh/HhOxi1o=
X-Google-Smtp-Source: AGHT+IETySV/NwwqbbDLqMU7Mh5iub1oxToadv0ZxFROQaZJtAgApSrTnuto7oLvvORtd6L1Dbo99A==
X-Received: by 2002:a17:906:c314:b0:ae0:635c:a400 with SMTP id a640c23a62f3a-ae0beb0531fmr22317666b.51.1750788977207;
        Tue, 24 Jun 2025 11:16:17 -0700 (PDT)
Received: from localhost ([2a02:8071:b783:6940:36f3:9aff:fec2:7e46])
        by smtp.gmail.com with UTF8SMTPSA id a640c23a62f3a-ae053ecbda9sm905954066b.48.2025.06.24.11.16.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Jun 2025 11:16:16 -0700 (PDT)
From: =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>
To: linux-pwm@vger.kernel.org
Cc: Claudiu Beznea <claudiu.beznea@tuxon.dev>,
	Nicolas Ferre <nicolas.ferre@microchip.com>,
	Alexandre Belloni <alexandre.belloni@bootlin.com>,
	linux-arm-kernel@lists.infradead.org,
	Vladimir Zapolskiy <vz@mleia.com>,
	Conor Dooley <conor.dooley@microchip.com>,
	Daire McNamara <daire.mcnamara@microchip.com>,
	linux-riscv@lists.infradead.org,
	Chen-Yu Tsai <wens@csie.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Samuel Holland <samuel@sholland.org>,
	linux-sunxi@lists.linux.dev
Subject: [PATCH 0/8] pwm: Drop local locking in several drivers
Date: Tue, 24 Jun 2025 20:15:36 +0200
Message-ID: <cover.1750788649.git.u.kleine-koenig@baylibre.com>
X-Mailer: git-send-email 2.49.0
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Developer-Signature: v=1; a=openpgp-sha256; l=1325; i=u.kleine-koenig@baylibre.com; h=from:subject:message-id; bh=S8bWVrtohU804TFCIPr4aot/z07tET4jFwVUKYqLlZ0=; b=owEBbQGS/pANAwAKAY+A+1h9Ev5OAcsmYgBoWutKdlfvI7KIzHJ+KN9OasXDBe9Ets/iGGJT3 I980PyuD9GJATMEAAEKAB0WIQQ/gaxpOnoeWYmt/tOPgPtYfRL+TgUCaFrrSgAKCRCPgPtYfRL+ ThL9B/wNCs36L/ISd4BA7zNBxQj5xBfjauGisVwporrJNf6qsKCwNrXQzidhknNvp946kr9gTj/ 3GZpj2d+UbQZ3AVgOMPIGsP4KkUomd8bCzxxuV8vCYvqB3oaXo4u7MUMI0/Y6JSmjh9RdLL2nz4 svG2I8ba2XHL8nWHRPNDbvQEPjsDTkU4/z536VcFjQXP1gSTOa/+Yh1JnyezwiP1gcGOBLeUj3P guQ2ykm0AKCku7biNbXTJzIkI1Mzz8P3Tso4jJGZ6a7mquAzUpmue2SbYP1gMV/nm416ULVDwW3 gxd2zphLoM96KFKamXLTbVyKW7sNAeHWRXFVNMiUH+EJF2Kx
X-Developer-Key: i=u.kleine-koenig@baylibre.com; a=openpgp; fpr=0D2511F322BFAB1C1580266BE2DCDD9132669BD6
Content-Transfer-Encoding: 8bit

Hello,

some time ago the pwm core implemented additional locking to protect
lowlevel driver callbacks against driver removal. A side effect is that
.apply() and .get_state() are serialized. This allows to drop some
locking that is now superfluous due to the core's locking.

I identified a few drivers that are affected; these are cleaned up
accordingly here.

Best regards
Uwe

Uwe Kleine-König (8):
  pwm: atmel: Drop driver local locking
  pwm: clps711x: Drop driver local locking
  pwm: fsl-ftm: Drop driver local locking
  pwm: lpc18xx-sct: Drop driver local locking
  pwm: microchip-core: Drop driver local locking
  pwm: sti: Drop driver local locking
  pwm: sun4i: Drop driver local locking
  pwm: twl-led: Drop driver local locking

 drivers/pwm/pwm-atmel.c          | 12 --------
 drivers/pwm/pwm-clps711x.c       |  8 ------
 drivers/pwm/pwm-fsl-ftm.c        | 28 +++++-------------
 drivers/pwm/pwm-lpc18xx-sct.c    | 14 ---------
 drivers/pwm/pwm-microchip-core.c | 17 +----------
 drivers/pwm/pwm-sti.c            | 23 ++++-----------
 drivers/pwm/pwm-sun4i.c          | 10 -------
 drivers/pwm/pwm-twl-led.c        | 49 +++++---------------------------
 8 files changed, 21 insertions(+), 140 deletions(-)

base-commit: f817b6dd2b62d921a6cdc0a3ac599cd1851f343c
-- 
2.49.0

