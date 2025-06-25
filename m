Received: from mail-oo1-f43.google.com (mail-oo1-f43.google.com [209.85.161.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3FE0D26A090
	for <linux-sunxi@lists.linux.dev>; Wed, 25 Jun 2025 15:37:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.161.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750865838; cv=none; b=JuEBO1r2+AB9TyqxogINvOVsi1RpniVCOE7rba2ftMoZhHuNjqkM0rHUjlkHOXUJ8EWS9+tzcNKid1grlJclp3wz7hjStHCSDYWnIY5uT/NUkqMUb5gfLN7YMaDz1ep4zl8T7rnMkNnFDQceNTVTgdeWRV2RuR/DQ2hAeOHg8Fg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750865838; c=relaxed/simple;
	bh=GZbowAUaJHWyymfTn3z1ubteOCTZVcoXHo4ZbeCumxU=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=Mm4PrLEt97J6P8Hjc5e8IVF8D8INQksQo097VBLkSpO49pgP91kmZHf9LX61H1GlDGAsTfpcHjfNfbmEymobpXtjwZj3nhbTNLANdiDJtOYH7BEUvsRKT8MpouqoUuCtyyO4H4QUV681QnUHOgME0QsJZUTjJK7/Dhw+WtY59uc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=konsulko.com; spf=pass smtp.mailfrom=konsulko.com; dkim=pass (1024-bit key) header.d=konsulko.com header.i=@konsulko.com header.b=siehk02S; arc=none smtp.client-ip=209.85.161.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=konsulko.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=konsulko.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=konsulko.com header.i=@konsulko.com header.b="siehk02S"
Received: by mail-oo1-f43.google.com with SMTP id 006d021491bc7-604ad0347f5so2403eaf.2
        for <linux-sunxi@lists.linux.dev>; Wed, 25 Jun 2025 08:37:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=konsulko.com; s=google; t=1750865836; x=1751470636; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=S8v5EXu2aDSwcRpR4btG89VkouNHXlURDaVlvOIHIlY=;
        b=siehk02SgiOiwOz+kbpj/3tQa/Fx+BqgOu/6xRdgSLh8ISu++jcVoMqn5FZteZk31S
         McdsBzslO0eYSzwUs1s45Mv5Sj9cQv9aRhDikk7sz4irp0Cn9/fkP71Apa5Q2G023Ww7
         yNsQQWpEk8hRIPhEuvZAuOBzRGuDI4ydHEQQg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750865836; x=1751470636;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=S8v5EXu2aDSwcRpR4btG89VkouNHXlURDaVlvOIHIlY=;
        b=JZrVxWufGL+V/SaygJjkgf7TFLjte/43xHSvbKc7Hc5AiMgOTh187yoLcCi4V23NKV
         Sa7OuWOOCBi1adjAusRSzPN84Lqj3lcVk8Hm5lv4mcNmp4MXHVDEMniS23akHD2gNZG3
         hju9IM8WYG23F1vRi9u12539ckxaesCamzYaxH/+nv8a7rXG1nWfpdiQCDYcC4ZDuOTv
         zYfTH3Rp3zgSBhiNDk6qem1ngSbY5Ie5jT0bGunRSlFuzww/5rB5jKV2tjo/gKnuWbT/
         u41kAnchE7lXNITGhRNFRVCkxWs+IXssW2E6jRAhvISJPtdOH4wPL2yZbuYey7x3qTlN
         KWdA==
X-Forwarded-Encrypted: i=1; AJvYcCUG4aT7V5OWQ2TtfF9Whyai1mJkiESc89qEZl9nfb95YWbrY7IvOvObM8iiDBLeUpkbGhPmyRAZFm+M0g==@lists.linux.dev
X-Gm-Message-State: AOJu0YwWujgOpLqt9x6+OAAtsbloviTEO5JoXdlTLR4Qg1w7Zaa24df5
	cSgDedIv/M8YR3gBPGlKQYOL+LtoFVgOlcjeSAeY85GYrPuovsOgqi80TavpeH76vGk1vaXc9jD
	VKLJxp2c=
X-Gm-Gg: ASbGncvlq2V/ZW5vOslHbpIfstJ4tlOZO0uobMfD5iQoIMD4Olw6Foy/JvC9rHflD3l
	P/f3h4m1TbN9dArsD++4okctcGnS6wWngnM7UiEfjhTsUjgX5U9kOrwttZ0sKQtxG7SC8M+CmOH
	CCUf+4lbZBC+ySPFtsk4SOl/f1mKjXfIIEoaGYQAnHSMvbNkVyvB0kUz+1p+odUyVIZY524bRJ2
	fnCQ2PHFK0eN/jMycyo2ETVlGfsVQg2SskIoq7NZZJu0pDKcc72LF7q0oi9NWgrAlZFi/gQED4V
	fgt7nWsn8lgs5ROpKUNjCP64uYkW11F5CPBz9D7Fr2wuCC+B2Sx+R2BUvpR3vc3AaLLsmY6/tjq
	K7dDyI/3ji9AMOP42lKWh+A==
X-Google-Smtp-Source: AGHT+IEAyrPpSzFuoZIGsziLNbizciFlK0mnzRBruSwL6Ux1COap9q0GlDEJHd16A3j3WiNxPyRddA==
X-Received: by 2002:a05:6808:e83:b0:406:6671:6d1d with SMTP id 5614622812f47-40b05aae6b3mr2814869b6e.15.1750865836250;
        Wed, 25 Jun 2025 08:37:16 -0700 (PDT)
Received: from [127.0.1.1] (fixed-189-203-100-42.totalplay.net. [189.203.100.42])
        by smtp.gmail.com with ESMTPSA id 5614622812f47-40ac6c30aa7sm2212537b6e.20.2025.06.25.08.37.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Jun 2025 08:37:15 -0700 (PDT)
From: Tom Rini <trini@konsulko.com>
To: Andre Przywara <andre.przywara@arm.com>
Cc: Cody Eksal <masterr3c0rd@epochal.quest>, 
 Paul Kocialkowski <contact@paulk.fr>, u-boot@lists.denx.de, 
 linux-sunxi@lists.linux.dev
In-Reply-To: <20250624192738.13062-1-andre.przywara@arm.com>
References: <20250624192738.13062-1-andre.przywara@arm.com>
Subject: Re: [GIT PULL] u-boot-sunxi/next
Message-Id: <175086583541.1401475.1224819033827719234.b4-ty@konsulko.com>
Date: Wed, 25 Jun 2025 09:37:15 -0600
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.14.2

On Tue, 24 Jun 2025 20:27:38 +0100, Andre Przywara wrote:

> please pull these sunxi changes into next:
> This concludes support for the Allwinner A133 SoC, the biggest chunk of
> which is the DRAM init code. Also includes support for a devboard using
> this SoC, the DT of which  got added to the kernel only recently. The same
> is true for another H618 devboard, so add the respective devconfig as well.
> 
> Gitlab CI passed, and I booted that briefly on those two boards.
> 
> [...]

Merged into u-boot/next, thanks!

-- 
Tom


