Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.224.52
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793964886;
	b=GxRqhUthEpF6LQVwfCjF+slyU8QjjHkZ7c8z+tQTWs5AUuSYeU2SbFNUO1iX8mxxvCLO
	 bZDglon3UJdxIDXgWdaOOJY/2j+P74ddV5pWmrxQ2OiTZs1GxCijBigAkLgmxKgtRE+uq
	 CBf1Xu1Gjxj7D98aQc1yNjKOsrbqDH56N6E+pYw1iRi+MgprHJKbeTIXZ8wXcqvTF0lY+
	 Z6xriKGPfHDh103PPLAse7r92Mh/Ar1zY7hvCETe9T6vJCQOJhir3C+ZSTCi6ev+tefV4
	 TbcYb+CV0poKahag7SjEENArHEuly4FgzB2pnDVyoafbs+/OoiZK5kWAWsueFYGQImQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793964886;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Type:Content-Transfer-Encoding;
	bh=gt1KO4qbrQ9HgN6E5uSpDhwtoQIKzsHpLRksFqC1ApY=;
	b=JCaEnALTZbHFH3cEB1NajGPF1KkWWkT6Pxbkc8Lf3XiO/6pfl7BvIB98u/1YNeZejeXl
	 f7g4SIdrK4EriAvLbLKsTLmgMG2tXafAxH5UXobg3gsZzOoQoGiLGzzYNcsOBijQ7FwHi
	 oZXd59op9hHwLCtAHlDbE5mO8YS0Rom1lvzME0kSUhaiDVR4xVtYwHEPu7N7Q0W7iOI8y
	 I21PDAZjkZOozPB9JtkgaQNEpF+bNmkF2OvQ1YKLGfeHV2xFw2tSJRDUM21O0bdpLcOK8
	 KUXO9d9mFo0gpRrvfZTD1PbAGkBUS/J4PvC/FAxRm2hJv6YHW9IgvesgNQMKm26YBzQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=H6qJm1rg;
	arc=none smtp.remote-ip=74.125.224.52
Received: from mail-yx1-f52.google.com (mail-yx1-f52.google.com [74.125.224.52])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E29AA606DA6C
	for <linux-sunxi@lists.linux.dev>; Fri,  6 Nov 2026 11:34:45 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E29AA606DA6C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=H6qJm1rg
Received: by mail-yx1-f52.google.com with SMTP id 956f58d0204a3-67bef25eb92so640465d50.0
        for <linux-sunxi@lists.linux.dev>; Fri, 06 Nov 2026 03:34:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793964885; x=1794569685; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=gt1KO4qbrQ9HgN6E5uSpDhwtoQIKzsHpLRksFqC1ApY=;
        b=H6qJm1rghedGFO6SegsfP9/xIfHDRWxYlNFpTchBH6VGWLTrbxUVSMLv4sdr4EJyLV
         bS54/ChNO+AwA5HALtcAOaWZoSZmGl1r86/c9p4f+PwLXunxT2B+MJmNyOTzOMGayWhV
         dJmqemgN4sMJ54df6J2mzi4vpwHxk59+GRUeJAQx9PciprXt/bwAb1RRfe6AJ/eBwcZe
         z+zgmJkFZnCAQK1QP0LsNrwHx2LoWkSGKv2L9VAd/+Tb9XlA7XxFvpEbg5250kdQdU2r
         hn4cc698Sj0wemiWC6hsw610gpmWZrfcgaANCu8JspitNGV5XHsT1XRInPI+aCAs/TJ+
         868A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793964885; x=1794569685;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=gt1KO4qbrQ9HgN6E5uSpDhwtoQIKzsHpLRksFqC1ApY=;
        b=cmBiW5UyOxBBiC91IhEoB/UFVJl9NweY5j47gsLKxlnVi1Yp+alXr/6bo+1LNM0w/q
         /9xOCqrD67XRlNtO7XS+QCvoBeQHMs348ThJUC/rS80kldWjkHamc5DZFK+YQVmpnFIe
         gmkgzsR3JMvrvQ/70km8zYVM8q17qH6lS9LKQ/geY7AU7xvtsY0LtPABC8b4S13v2YhZ
         O/VCDqZQf78G7S2M2jiOdKU8TZJooQeLkd0lHVn9XPPKkk+Rp/Kghvlw/G+JKQS6zzll
         hyfoHkayiI7xyqB2Jf6aBwC98NwUCQQ2yE+5RsMqnObCiNOU64CwLD9UITfYGOZnmJCc
         +Lzg==
X-Forwarded-Encrypted: i=1; AL+hErG/P6lUy5Rz7mrHb3BA/ekZr+hXgELES7Y3H4YfztebHWSoq87A3Y1xTK4wL6iEq9VOEUR+39w8fllpFg==@lists.linux.dev
X-Gm-Message-State: APuU4Z9jGmFBRMPPjz6QJtcXoI1b33lojdXtocotMKih4VTz1oyXF7Ai
	R7EPhqjYojq3fzN2nlc3D4s3JB6mQVq1HThP0R+Np1c8vg3Vdc8uZ1sP
X-Gm-Gg: AYBFou3qfAVNRPH6xgUzgpAkzBZFOK9Xvx/FDq2OGyuGhkqq7/31tSRR1m7YK57ZhY7
	uNC7sYPEhZYFY2EZW8kbCXYH1iNGNOcOB6qJahqE09LtBkbiKrlVitFrN39QEbP+qM0Ee97rYOp
	2+TegzRCtUkqnTtfAxzwqB9knYgo55abyYYYj28V1b1vlgZo0cZ0z6/aCjXkBjMl1B6KZcGl174
	lc8baK9FHHPFi9emdv4NFA0cqIVm1whIIBMatSJUVfuGdsjewZiOxL7F7rO8NGLP7nhLlxPjlPp
	yWNWu2WJG8GD6yhCDxZcH79b6s8ghhkGSpuxtQmmC87sKWNsUu/KI+q0ahmtxOwNkIHNNYM1DU4
	7o+w6AzbbtWbALDPqz51VVB+syIM3ciVgoQDTDRDCZ1WGuvqL0yvelvMMv79I9Dos602ZrunNDI
	e/PSyNkX4YqJpirWSS6/aZCvaP/y9CyL/De3dG47GCFv2GTf9JzYy3Nv61V67E/mvYG/wRJpAnl
	4K1aFLqDF11hzYdTBmXlaPvDH6nHBCPv6j/WsnaOOdtGbUF+kifRrJez4S0lJKjZj2+Asvpg6Cv
	fgvulghYQXWAi/cxNkEgF3pcTpLQ/RA4/qT8N8kLDGqxlWpT4idKC+Env65KqMRGEZi9M6EeqGD
	PpPXmiO8sLaWyiaSneddeNI2knbRRYq7umo9RqR8raWd8FonvtOCNFI7l3Q==
X-Received: by 2002:a53:490e:0:b0:67b:f09e:da89 with SMTP id 956f58d0204a3-67c14249884mr916080d50.10.1793964884851;
        Fri, 06 Nov 2026 03:34:44 -0800 (PST)
Received: from MaquinaLab.. ([179.179.238.247])
        by smtp.gmail.com with ESMTPSA id 956f58d0204a3-67c13540451sm1708137d50.10.2026.11.06.03.34.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 06 Nov 2026 03:34:44 -0800 (PST)
From: Vinicius Pedrosa <vinicius.eduardo.pedrosa@gmail.com>
To: linusw@kernel.org
Cc: wens@kernel.org,
	jernej.skrabec@gmail.com,
	samuel@sholland.org,
	andre.przywara@arm.com,
	Enzo Adriano <enzo.adriano.code@gmail.com>,
	linux-gpio@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-sunxi@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 0/2] pinctrl: sunxi: A733: use the two-bit I/O voltage fields
Date: Fri,  6 Nov 2026 08:34:24 -0300
Message-ID: <20261106113425.28936-1-vinicius.eduardo.pedrosa@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261012184130.548261-1-vinicius.eduardo.pedrosa@gmail.com>
References: <20261012184130.548261-1-vinicius.eduardo.pedrosa@gmail.com>
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Post: <mailto:linux-sunxi@lists.linux.dev>
List-Help: <mailto:linux-sunxi+help@lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
List-Owner: <mailto:linux-sunxi+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 10/12/26 15:41, Vinicius Pedrosa wrote:
> this follows my question in [1]. Andre asked why not extend the A733 I/O
> bias code to two bits instead of switching it off, so patch 1 does that
> [...]

Please disregard this series, Enzo's v2 supersedes it:
https://lore.kernel.org/all/20261104-a733-pinctrl-v2@gmail.com/

Thanks,
Vinicius
