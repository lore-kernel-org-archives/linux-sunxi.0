Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.161.49
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792627742;
	b=ZpVVq2ftDqH9pxZdQnr1pYP3F4h3xHRvQheGZ/hTHG379yqs8DbcPKulirIg+vrguHkF
	 4prFBeRnlR6KwzYOZrb+bsvyorFHSKVO0hpmNk1ppFKPIzS5p4cao9nPPRKgJ8yOS1SUw
	 rAxSuy9BychhG1hzMEW/X3ukcRjZLMiKFxpm74FCg/lE0Z1h8JakjewSN1hDvPo3urFBW
	 d5sM0209/d0FlXhXLTMHkK5ekrzsDJ+AsIX27XZgj7Tw77wLXjOmyLO4WtSfHEGMmYfpp
	 QtfY3YpoflfAAFwWUhGhdlb+2anUB3CJ87bQQYXSgtKzGGgJO3d+IMhzq0yNtiVnFKA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792627742;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer;
	bh=wotwEdh8TFdVFdbwz2jBQFukWF5WLCNBsDV31JlApTo=;
	b=fl+8q50TNHEPyd8S9cl3Uy30yMAUvTAq32BTJ2JVHQ8F02OvpAWmPOczP+IJ6iZlaAVB
	 RCsXGSeGBOmMj9si13grDtFrQ/MdtdLmVo7l0LkLEeRqlK3SkCwMLiwJ5cCPdDQQEv6f6
	 GXDHVJ/Q9pkrGsH0sM5jwCXZoED0qCD+7tRcZOGWFl0sLEftVhTAOxLu0iiqLnUhU/qpw
	 ftaBDQsDo+LJ5JI4uZOhwBMRa7ebW3lTMOgwMjx6wXOISG0euxxrqd7i22Qazmxy6vyt1
	 ORrgGd/7Npb0GA1qEWcAbgnpGtmbTTfNEfwM+0o+aKX9rxMcCjdLCm27RXsHzrqqqrg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=YrptfQV9;
	arc=none smtp.remote-ip=209.85.161.49
Received: from mail-oo1-f49.google.com (mail-oo1-f49.google.com [209.85.161.49])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 233F1606A32D
	for <linux-sunxi@lists.linux.dev>; Thu, 22 Oct 2026 00:09:02 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 233F1606A32D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=YrptfQV9
Received: by mail-oo1-f49.google.com with SMTP id 006d021491bc7-703be215729so548520eaf.1
        for <linux-sunxi@lists.linux.dev>; Wed, 21 Oct 2026 17:09:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792627741; x=1793232541; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=wotwEdh8TFdVFdbwz2jBQFukWF5WLCNBsDV31JlApTo=;
        b=YrptfQV9laLVs4KAhtL6gW4QvAahNuN43/vZCLmaaX5cm9xinNW1Xd930JBDSNgYm7
         LKOU4GGBblapCLdUek9H/7NionJbbZzMboUSehAB2k02FQcan1FgvWd+AGY+8Z5JwCgl
         nLhvbbFJO80yI9cU878C37UEh6R4UiAuwipGdHMD0A2HAf0q3YIJzPNTpa0tsXhcb2bh
         pOlsNuzmAJ6zpeA5a+W/CJszUulf6bQkW+Q3jsUdX+UxU1DBZGJul+xVSfe2hSRuOkGZ
         3dcYo21iNfriwE27Rdl+ZRfhUpB4eTaIKT+q/hFOcgPThLMajlvUQWHlJP/2orG9pqbm
         aqNg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792627741; x=1793232541;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=wotwEdh8TFdVFdbwz2jBQFukWF5WLCNBsDV31JlApTo=;
        b=Yxh8IeHKxtuLRvf9Scch/xjEuH3zUVDUNfBHBD75ZluJQ4D8tnj5o8DLjdfNCppQwH
         zupiaPGFt2gv6K3GH4R7pFlmQqG0rwxBRguaYa0ppA6yhrttwvpPiPtoU2zq7Ac90gfF
         fwMzKxOcxWSWNnlhMgTI0+6H9zqNyai93jYXaaBu9XSua1V5iYt4dIKCxHoKJaD5mZqW
         8f1Fd9Gg/wqKpRARqC2T1GSzsUIvejSZ0FCQ/5yoowE+4+ee/fWOKa9hSKplp9CLWl9P
         H1iSmD78nzYHyANVpF5Gpo8uPuYJ10vkAvdx/L4K/zIxu/mGl1MM8ys/gMTolvyuw+vq
         tYWg==
X-Forwarded-Encrypted: i=1; AKwUvBzCo1YB+Mr4ey75w8BY3mJdvJPkMDKDVGVdkMukI3IcRG1vkeNx88ALvnKaumeHpWQdJPsyQkiquQbtOg==@lists.linux.dev
X-Gm-Message-State: AFq9FYJr+ZrCqfpk0VMUYp9YNukdU03fPuduo/XeHwhuI/idAiduqBRB
	rP7+MlY8IFiQG/MnvWy0BbABz4n3GtJKmEucS8DKGmuoRIqGmDYY6l7U
X-Gm-Gg: AYBFou2r6z1UIo7lQnj3uXxGRcnvjXnDodnY0Kw3gHw9WCZpRafWoZamDo3O89Pnv4A
	WEHk1nIj9EXU1av6NWoovGTaPxccltb0D0LAKtki9xy4F9CAV55Jp+G7lIffersyMGscSnfsB3b
	zA4DKibeGxngFgix1J3ZYfM3VOO23c/ZivBGG93fixDQF9Tq+n1o8W38yuzTICJcjOtLul5Jj6U
	otmtVBt4jbCIYydkXlBTgXb6HdDgEKNkYXK+P39d3kOj87jk3WoX+I7Xz8vNOvwXPsBdWq76EQA
	E7YGx77AqlUBMaIyV+L3YfyJAbM61hj7aJI23Nq26cTMd417Z2gfmXvQyBiqY5twobLClMw10OF
	3n42waAc2wzstCqFwb8/EPJEbDWj8CCsTNlc8G/vOoFfKle7EUtjkVcXTyAG+nVsJgaeNNJ+aDt
	3ADn/qajHfW2nVbTgkRB9CZ9Jo/Qlpf+ssktvn92J0UHZ8yyzNM4m24D0LO0GQWVEnubPGpQkVg
	qk4lH3YWKAE6q0OfIx4A5lTp7FHVh7y4WjsDf4yVGxpixUROLM9usOA8QsSUTg4DMdnd9IVcs8d
	29QYVuKQK4idl2FtrQMv0qSfykNzLUKlFfNnOuuzIrsLW/6pQZpCu/yedF60DzqBD+VPMFe/gZc
	EU+Pn9uZKhPTbnBV8pZkUQZXICCgbmksv78unBHxqRfiteoso6DusteMHynHDrWrdO7sqPzKXZ4
	61aAE=
X-Received: by 2002:a05:6820:1889:b0:6de:aeea:5c90 with SMTP id 006d021491bc7-70940d7dd7bmr2299772eaf.26.1792627740866;
        Wed, 21 Oct 2026 17:09:00 -0700 (PDT)
Received: from [127.0.1.1] (174-29-1-49.hlrn.qwest.net. [174.29.1.49])
        by smtp.gmail.com with ESMTPSA id 006d021491bc7-70903bc246csm3281362eaf.10.2026.10.21.17.08.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 21 Oct 2026 17:09:00 -0700 (PDT)
From: James Hilliard <james.hilliard1@gmail.com>
Date: Wed, 21 Oct 2026 18:08:56 -0600
Subject: [PATCH 2/2] clk: sunxi-ng: h616: drop the private APB2 clock
 definition
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Post: <mailto:linux-sunxi@lists.linux.dev>
List-Help: <mailto:linux-sunxi+help@lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
List-Owner: <mailto:linux-sunxi+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261021-submit-sun50i-h616-apb2-clock-v1-v1-2-7b857ad1198d@gmail.com>
References: <20261021-submit-sun50i-h616-apb2-clock-v1-v1-0-7b857ad1198d@gmail.com>
In-Reply-To: <20261021-submit-sun50i-h616-apb2-clock-v1-v1-0-7b857ad1198d@gmail.com>
To: Chen-Yu Tsai <wens@kernel.org>, 
 Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Samuel Holland <samuel@sholland.org>, Stephen Boyd <sboyd@kernel.org>, 
 Brian Masney <bmasney+clk@redhat.com>, 
 Jerome Brunet <jbrunet+clk@baylibre.com>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: linux-clk@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev, 
 linux-kernel@vger.kernel.org, James Hilliard <james.hilliard1@gmail.com>
X-Mailer: b4 0.15.2

CLK_APB2 is now defined in dt-bindings/clock/sun50i-h616-ccu.h, which the
private CCU header already includes. Remove the duplicate definition and
update the comment describing the exported APB clocks.

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 drivers/clk/sunxi-ng/ccu-sun50i-h616.h | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/drivers/clk/sunxi-ng/ccu-sun50i-h616.h b/drivers/clk/sunxi-ng/ccu-sun50i-h616.h
index 7056f293a8e0..8a07c27c77d5 100644
--- a/drivers/clk/sunxi-ng/ccu-sun50i-h616.h
+++ b/drivers/clk/sunxi-ng/ccu-sun50i-h616.h
@@ -40,9 +40,8 @@
 #define CLK_PSI_AHB1_AHB2	24
 #define CLK_AHB3		25
 
-/* APB1 clock exported for PIO */
+/* APB1 and APB2 clocks exported for PIO and UART baud clocks */
 
-#define CLK_APB2		27
 #define CLK_MBUS		28
 
 /* All module clocks and bus gates are exported except DRAM */

-- 
2.53.0

