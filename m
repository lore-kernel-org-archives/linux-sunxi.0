Received: from mail-oi1-f176.google.com (mail-oi1-f176.google.com [209.85.167.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CBD8E8615A
	for <linux-sunxi@lists.linux.dev>; Sat, 29 Mar 2025 16:37:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743266239; cv=none; b=Oj7/i4eTaMK5IGawAVuqeFtNtt0PsKgtVzZGPhsKIMkHvVgMlq6/lBtG3GKhFoVwoA4X0ionDRUD/JEzoc2K/bXsLrQz8syP8oe0nJhtFrJkIpB/wyqXNTL8GVkCW3QRMZqR/ucGJB6Ys3lDUGAI0nu7R5xnTnzBZYgc8M8mV8s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743266239; c=relaxed/simple;
	bh=t0lEVTxbz5+YnLWL/IMuqdf0yHAENWgsVkRovJLU0wE=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=mmFc6XAACzZxdQe0fl7PH8NGBUa2jxOMA3q7KIG/RJ+dbgdMO+qqZfWB+8nE/Zb8QnDrgAFK6FV+dt+X0BOyWQhysOMJGS8Ur+eBNR4LQvMWcUFLD8hf8zHxZ+gxxYXvLCEWNwg95BWD++LEYb0EEYSQy6gKoRIOVYt2yBE7THk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=konsulko.com; spf=pass smtp.mailfrom=konsulko.com; dkim=pass (1024-bit key) header.d=konsulko.com header.i=@konsulko.com header.b=ojeqn/Wt; arc=none smtp.client-ip=209.85.167.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=konsulko.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=konsulko.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=konsulko.com header.i=@konsulko.com header.b="ojeqn/Wt"
Received: by mail-oi1-f176.google.com with SMTP id 5614622812f47-3feaedb6670so1921448b6e.1
        for <linux-sunxi@lists.linux.dev>; Sat, 29 Mar 2025 09:37:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=konsulko.com; s=google; t=1743266237; x=1743871037; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Tdw4NX1XXd9o6UvrntRwBB26VbQgoApAJWsvC1pLdaw=;
        b=ojeqn/WtFCqtiqjVdBifE0OAmJFjE92W9dXz2Jqw4V7aid5fpMegvFU8YwD4V/t9Wr
         g5HGuwpFmik4E3rAZXT3a6M+KaQkaTppdrI/5YqWpYeANE6FftVCCsn9pCaDMTQovOl3
         kTTuulXb+uk4zj848pf7een0NCoIvCdXda5h8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743266237; x=1743871037;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Tdw4NX1XXd9o6UvrntRwBB26VbQgoApAJWsvC1pLdaw=;
        b=b3nLzQzdk9lB+WiGUvPqRo3e8znTLHIuZY1Bf6wiLQFJ5Sg9pOlti1aRHVd0116pH4
         Ui/IFlmNHLBcnlH+GxHs5NUkwEh4lJ2xCCNb4Wr2BBk0HGTM5uPE+yk8zwOukL5Q12Wx
         sgA+fIDjDJLRpOi8vDthmjYvG6FKs+7oXUVeVRBXki9648DZ4QldXyV3n6NoFP8e/N7i
         FufGtYklLQIEMygypr2kDWjliXZkUmE65ZR6NHdGLPCwaKHhyeRbS7C35dOpqnDyH66I
         B9JSFp08d7+yUE/TCxKc6tiFbBdRq3sWCkgc2pC25UNu1ufoufbge2+TgHeH6/K0+U6A
         cPJQ==
X-Forwarded-Encrypted: i=1; AJvYcCU6Y5SYeN7CqVTKdIXFsjc4C4Hm1ZWeq5D4FW34CIkIdwoXZvB0dcyGqTk727VAyrKLgInUuIxUTk0GgQ==@lists.linux.dev
X-Gm-Message-State: AOJu0YyEPC8qYILpC82FrWKaOqVtRbQeJYWaRuC8AKbLEl3/q8g5chMm
	SE5u7HhR0rNqRt/Baz1T23hARhLV8JVE3GZ/i1Ok22eqGQJyRNXop8m+7t774a8=
X-Gm-Gg: ASbGnct5C0dCjt6WFMfkXiUdy1iQRme23RBjWwzl5OxMjFabmx3axQ0bFyVPnZ1hCuT
	kLuNUnneL0u2WfJY+R2+POQW0EKu9md/DiNxRIkt8dSy7nMpRSJsu7p2H6owW6xMwhteWosb5tT
	SxsG03qhLgqn5Uqddye9gDu6gsK3rcyk5wnyyxOkcNYNU2Hh1pjvfUiaQNVMj0oC4Su8YnVY13+
	fcfMEEEoEXETHBF3fDTOW/r8mfZQr3+FdrJ0wzcCGYf+tB/i9p464VSIb6WENDj0psPvJle8z3V
	1P0t80gRr0vuh/qPe2H3S3HqAWap6G4ID59i6Gm2VnIjZLk9I17SGYxLuaOaQXMO4oH8JL/MGkg
	GKzNG
X-Google-Smtp-Source: AGHT+IGtCwVtyUBKksnYHD3zk06XJkD76upYWgNrHvYD/Jg4+LwG2yENgw7hhPVD5x4NEG3t0bFKqQ==
X-Received: by 2002:a05:6808:1406:b0:3f8:e55c:16d6 with SMTP id 5614622812f47-3ff0f5b5bb2mr2129767b6e.28.1743266236862;
        Sat, 29 Mar 2025 09:37:16 -0700 (PDT)
Received: from [127.0.1.1] (fixed-187-190-205-42.totalplay.net. [187.190.205.42])
        by smtp.gmail.com with ESMTPSA id 5614622812f47-3ff05278de3sm766988b6e.36.2025.03.29.09.37.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 29 Mar 2025 09:37:16 -0700 (PDT)
From: Tom Rini <trini@konsulko.com>
To: Andre Przywara <andre.przywara@arm.com>
Cc: u-boot@lists.denx.de, Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Liya Huang <1425075683@qq.com>, linux-sunxi@lists.linux.dev
In-Reply-To: <20250327111214.2064340-1-andre.przywara@arm.com>
References: <20250327111214.2064340-1-andre.przywara@arm.com>
Subject: Re: Pull request: u-boot-sunxi/next for next
Message-Id: <174326623538.1009520.14409042559701400584.b4-ty@konsulko.com>
Date: Sat, 29 Mar 2025 10:37:15 -0600
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.14.2

On Thu, 27 Mar 2025 11:12:14 +0000, Andre Przywara wrote:

> please pull these sunxi changes into next:
> 
> Assorted fixes, refactorings and additions that are ready, and shave
> off some load from upcoming series'.
> 
> Improves MMC performance on D1/T113 (missed clock divider), enables
> eMMC access on the H616 family (never worked, many thanks to Jernej for
> the fix!), DRAM detection fixes for the H616 (now reportedly stable).
> 
> [...]

Merged into u-boot/next, thanks!

-- 
Tom


