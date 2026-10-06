Received: from mail-dl1-f48.google.com (mail-dl1-f48.google.com [74.125.82.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2ED0A39060A
	for <linux-sunxi@lists.linux.dev>; Tue,  6 Oct 2026 11:32:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791286375; cv=none; b=RhUaQdrfeqYaEETMQ6fOsK2l8h++A4Pd6jM5ozquySZCC0uttkhjqd02ln+2WHgXm1Yhj65a5RwMXXYV/MQhe/cBoEAP6c+o//c+S2UPz5dck/OET+/TV1DlvBybdrPwSJENIUfe+bisc40HnsHaAEOLAzuSXPuweYXQPuMnMg0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791286375; c=relaxed/simple;
	bh=rJVQWVlBRPTsSgWg/9d5PnkDp77p5gzV4IdCIE71rko=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=DDyWDiWoWfLRRnOyzx9+HRxKnxOCgAqmE25yKOjA0kYP8oeESPvCwELsOyFnpUdwT7D3cghSOqAPX7ENXS7qANkFmd4nmAS5ur8kQ9+I18MSMAjXxLLUH3XlEbP2HKifytxmcxPOnxgpROKNxCFWhVq6NB6IzlYdSsPEJWZodR8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=HSlGNjBY; arc=none smtp.client-ip=74.125.82.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="HSlGNjBY"
Received: by mail-dl1-f48.google.com with SMTP id a92af1059eb24-14129667240so276898c88.1
        for <linux-sunxi@lists.linux.dev>; Tue, 06 Oct 2026 04:32:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791286373; x=1791891173; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=rJVQWVlBRPTsSgWg/9d5PnkDp77p5gzV4IdCIE71rko=;
        b=HSlGNjBYW9ODU+E/6pN8JcT8g73OD4jqjtqIV3Cwq8bY14M4SWY8FbPynWvrZJg57M
         MSZNRhEDVV3LzR7uAdg/a7nFs3j63tfiBVFJ03utAAtJiOba12hDCZFMecR5Vh2VX6yc
         BYvLhwZQnz4qWQcjgM0EOD+il2SZ/MYzIqhFzIUsH/d884LR0fgbEV9/6njTOOdwz0xa
         RAuO8HeBesD9ueECD5KWtdfDVnHwoNG4J94EEAQ7oExOr2ecwdmRZSl8C8PWTUHZbyaR
         6WzbqO59F44ZGPyX4nijM/cohfXlQNab7VwpT7qawZKa6OrulSBKXYT144Y+tgKGhbDh
         fp3A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791286373; x=1791891173;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=rJVQWVlBRPTsSgWg/9d5PnkDp77p5gzV4IdCIE71rko=;
        b=IyoYZqr7oxX8VtS8y3uQ9uR1fH0wNkgDA/npZ6SDzupdbNV2wPNS5HLJgf580aTa34
         PbdrwI+Wy6w+UD7ZyBsJDfeoVi0nTChheVesfYyyPfcCTzcEwd/Iv0XzUxKSw9qlzs0c
         3tVoPIEvKwBS7H4/OqlJnYseUCkBAU5CgkumF5gyKFoeJYLm92WVWWZTaXMXUGSCp3dO
         lVoRc3zEluGcDD3bIR+b4jPyuMmZII5EA6eoL1KZLt/jGfGp2GJeZagN7IYZKOzwh7kq
         bz20C8ZE6ORU6+VA+Fm8VvbgzyuZAuz8z0c5CgV21gEenT+uaGvg2mJG2BB08HNo06kC
         r4Ww==
X-Forwarded-Encrypted: i=1; AKwUvByaUjGfBVM0ZyZlzbmAwd+QwfEno007bPLkr8Hon2885NDp5Ni8T4CQKw4mjg2ebY7JdeKmUFPSlEoOEA==@lists.linux.dev
X-Gm-Message-State: AFuF++mObezK04Z7YvTu9d0bLrfJDzJKFelQpG5eqW8c2wAHMn5lOoTE
	LPLXqKtl2alows8+L7w5D+tvfWiS6GLSLupdgcV9dUsk3tLolIy5wsqI
X-Gm-Gg: AYBFou3NXU/d6vS13xHure8qmi5QK7xktoK6BzrQl5vw+NpC6Gp5nTkC3DI36xjVlq5
	/50ymV47sfPmVvAS3xWlBTkrsorzsAUzJbD7OMb4FlMFM9PhjGh8RWDMYp8Qy/djI+xUpVN16Bk
	wQkzRWWuJIX4wV0cTCF7Rc+e9HFull0WwZaGUggNlrjtuafOiKyfYMXquTZJlCrds2VmkvpQaX+
	aM/MMErCu1oEcma/hcAUsoes5k/g6Ksx1w+2SGEiZNTC3UooD0CkrAD/ikShMrW2N38skLrRWNa
	wi/IK3nSTgFLErYp6CebamR+RYwjg9BEPNszM7NOK1bkR9aDEqFOwa7iC7fvFp2B102pTQLlO41
	kNP3JjXCN59LXY81+kSWq1o+Ei0cln4BF90sGxknYMHPC5Ak+TohugabE67v5gQJF4kskRAq6jf
	0Ia/xstlnNydyAc/LLHXxZX5Ffq8X6mfOXuQauENU8iBnbLQ+0GdouwdX6/X5qo9UWj5FC9v2A9
	h54/hVmPfDwMMz+fmcjPOttACa/n2Ipa5HuXGbemloiyi//A6eoJkWp8+sxeZve6t02j4syVUk/
	siK6fhEJ2WQHb9YY
X-Received: by 2002:a05:7022:eb47:10b0:151:2e62:fe4b with SMTP id a92af1059eb24-15eca269596mr1503491c88.23.1791286373021;
        Tue, 06 Oct 2026 04:32:53 -0700 (PDT)
Received: from MaquinaLab.. ([179.179.237.181])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-160677a08fcsm241105c88.3.2026.10.06.04.32.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 06 Oct 2026 04:32:52 -0700 (PDT)
From: Vinicius Pedrosa <vinicius.eduardo.pedrosa@gmail.com>
To: =?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Cc: linux-serial@vger.kernel.org,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Jiri Slaby <jirislaby@kernel.org>,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-sunxi@lists.linux.dev,
	Enzo Adriano <enzo.adriano.code@gmail.com>,
	stable@vger.kernel.org
Subject: Re: [PATCH 1/3] serial: 8250_dw: Keep the BUSY-safe divisor hook when DLF is present
Date: Tue,  6 Oct 2026 08:32:35 -0300
Message-ID: <20261006113235.86144-1-vinicius.eduardo.pedrosa@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <e9538164-3565-a702-c26b-bdc0b8cb1c6c@linux.intel.com>
References: <20261005172538.398522-1-vinicius.eduardo.pedrosa@gmail.com> <20261005172538.398522-2-vinicius.eduardo.pedrosa@gmail.com> <e9538164-3565-a702-c26b-bdc0b8cb1c6c@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Hi Ilpo,

On Tue, 6 Oct 2026, Ilpo Järvinen wrote:
> It might be better to add __dw8250_set_divisor() to dwlib to keep the DLF
> setting code in one place.

[...]

> It might be safer approach to NULL check .set_divisor in dwlib before
> setting it as ordering requirements like this are easy to miss.

Agreed on both, I'll do it that way in v2. I reran patch 1 on its own
after the change and the console still survives the termios stress loop.

Thanks,
Vinicius
