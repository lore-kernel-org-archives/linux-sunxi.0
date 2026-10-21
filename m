Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.178
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792597071;
	b=fvDanrPim33RvEt7y2V3vdjGVUixiuSkUo2mAxatkRW57WfrznSCrVQUOKLmTZ3E9Li7
	 ibElO3RrjSwRIMtv4/i8hsEz5dK/o1kky/jKg/cxlT4jPproAxbAaQq8GlsVaLyeKOTbU
	 ezMd2aDT6Tpx+3S/tFX7nOWYiv1GFOs6CWKE+aOitvq9iOHy1uv2CjXDKT8ttIyj1znP+
	 41QR5LYeiE+m4E0kEwSUjiMQHc81PV2GM12tnswhm39seXVruKf6jXCEh6SHvsbVlDlxW
	 ainhhSmIvcgzzEYUlDGPhQOo7iFXcbfakHqkYP12a8udtmXuB38a4YnGSxeVLFVoB3w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792597071;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Type:Content-Transfer-Encoding;
	bh=pcUJNAa1d5gYFOvrKvELkQqk+wRTOdmweUM3ujZu374=;
	b=V2ZZ/tCCOqkGy0PUhy/gN3d5HFaC7IlTE+RBa5Q3vxsJJv6QjhVmWodoQrh0XoPnI36u
	 hV78Y5j6JAxUoxhY+9BJR64EvnrdLNtG8Ar02brUjyrnBFMpftxVYObYXAAJKRIQb6qRH
	 WNlJhmNFnmlQAEPxQ5CBXOQvNOsAm+BlkoBVTBO5XhQqcolui9h0JNwWCvSKqyMzNVAbS
	 zpj1t9kNSETwjQdulWx4Ao0q4102WzFBYT0eEVVul30KyDbpwk/mYTc/4eqlTVMUrZJB8
	 cktMehviVCSx22i0JivVN9NsZyAQq4Esv5rj1Mn3+2g1qz2bf+SSCOFedR3rtZfoJWQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=S39oMMs2;
	arc=none smtp.remote-ip=209.85.221.178
Received: from mail-vk1-f178.google.com (mail-vk1-f178.google.com [209.85.221.178])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E054B606A31B
	for <linux-sunxi@lists.linux.dev>; Wed, 21 Oct 2026 15:37:50 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E054B606A31B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=S39oMMs2
Received: by mail-vk1-f178.google.com with SMTP id 71dfb90a1353d-5eabf243d05so338397e0c.2
        for <linux-sunxi@lists.linux.dev>; Wed, 21 Oct 2026 08:37:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792597070; x=1793201870; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=pcUJNAa1d5gYFOvrKvELkQqk+wRTOdmweUM3ujZu374=;
        b=S39oMMs2sUthjPEr8Ch2iq4i6l20UfPSl6Oo475a0HqOfodJFFyskA1nRS0yWY5a9L
         WbJPrE52t+nwExSD0jpnLbN29/pKgfDxiEU7YeW9AuA38bOgQScsZdI0fvHZgbKcoLrO
         /ghqnTHLoxx6RZv355AzEXzw4DpFqTW5mNn+fCGpMPzggKpEHnF7YHvH2WXsMM3Fmfbw
         A1s+7d/a7QdQ1UvivlVA9CAEuPuWmjtPPeW6c6jNkH0/HWT5nPnTTaySO5rHyBCT2IhB
         IG7uvdlvdJQ17ySx3IyusBoK7OXc0LGXRsVC1DHJvPm6PHm5H8n5XakrleQ0bUv/9xG+
         dQWQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792597070; x=1793201870;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=pcUJNAa1d5gYFOvrKvELkQqk+wRTOdmweUM3ujZu374=;
        b=TkUICTop0iHI9ZrxH9SmJKmegn3or4u7oY7RNlqATO7wYo4zGRkdfnIMRoFwnaAvOR
         xSaumjSit1Cv85HnXrUrubrUoJW/eLTq9wMLr0MUAzYKIaONxfIR6pjQZaiehcC4AQPr
         +SA4ljsGs6D4vftGMLKeQk6UjeVsrf1H47XssvNMhvxQNUAzyqa9XzsYX+YVsVye/PEQ
         dd2O7xO53MoRQ93aM9FYQUWDr9IYZIXPlxQkAJKglg4ZkIqTiDEDDVu4/DutiCddUqMA
         dGyk5mBqFRzPaDY1iiiu3jsSKtW7tFYrvuQ5mylH3bwnocUl4LavNEjqfDOjtVr7TuAI
         ZSFA==
X-Forwarded-Encrypted: i=1; AKwUvBxekdGa4wpCGvIRnajIIzE7MxyrZlI5W5ej+rfuRqXNX5VDFsI0DzbxKzbM5x4YgxQssJU5N3CkxScy9g==@lists.linux.dev
X-Gm-Message-State: AFq9FYLUFmrWDC0zitkUsrrav9G3ZYifQdgobogOmpnDf1joIUWDmris
	wK80dp+Z9dAxX6wt0PnWGnkMz77fd72XfLFtZVHrmGHwV3odNvdBPNMB
X-Gm-Gg: AYBFou1Rk0xvLvTxaWhdh0P4TXyyOwIvihjX/Ea3gs7S+wjZ9jaRs+CNK0ACoQssTLm
	ufxXoLZ0oVx4ENOjzDa6f0XwUtR4m1yjqCY3Vsr+q9VEWNcC+ZVIlZszWPF3MMNqUd1lRU44Rle
	PhrHlotW6GwnZ3whVc+BtXNo22+xCicOTtfeCfMG13JWX4wZh/blKgkh6S7x33dWZ+5s5qzkjHg
	PU4lGmKpod7ivukGDZDf2X6oisjsJI4sBZOUUATbbtpYyqT3Y2zolPcemmcIM3zvBJXXZW2jhjJ
	J4NGN8ZFMkqOqeynCHwOM0VFcMKT0Tz9++NqlRhIC8FIJBKMeDr5td0Ri0It9N7muNrVZMpcNC6
	uqH5XOF1q+ntHbBCYMs4hPN3mrGRfu+8S2h8dwFbVB3wsoP/+4mjKVxNHDlD/6nzJmlATbfBH1h
	fbJQSquyywTqeLY4DlJKQl3HvoFWM83zZYUAsUvPwUXkOmLl8HEuOlTwMZBYvxb7ySz14TvxUCT
	fa01rQl/fRi8mlMRRBUnsA0sTFFc2taVlz5D4n5ReAyBihig9Mrd+1BBFh8rJ/PB5NAZ8yPNHfa
	XqNiHEo4EcEPfyRXGhKILt3abquQW+jsz0of2YirHfhUrVAiXgupoOE4kBgyxpw=
X-Received: by 2002:a05:6122:3122:b0:5ea:db3c:4a3f with SMTP id 71dfb90a1353d-5eaebc14cdemr1063889e0c.2.1792597069786;
        Wed, 21 Oct 2026 08:37:49 -0700 (PDT)
Received: from MaquinaLab.. ([179.179.238.247])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-5eae97f0a94sm3505688e0c.11.2026.10.21.08.37.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 21 Oct 2026 08:37:49 -0700 (PDT)
From: Vinicius Pedrosa <vinicius.eduardo.pedrosa@gmail.com>
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc: linux-serial@vger.kernel.org,
	gregkh@linuxfoundation.org,
	jirislaby@kernel.org,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	ilpo.jarvinen@linux.intel.com,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-sunxi@lists.linux.dev,
	Andre Przywara <andre.przywara@arm.com>,
	Chen-Yu Tsai <wens@kernel.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Samuel Holland <samuel@sholland.org>,
	Enzo Adriano <enzo.adriano.code@gmail.com>,
	stable@vger.kernel.org
Subject: Re: [PATCH v2 1/4] serial: 8250_dw: Keep the BUSY-safe divisor hook when DLF is present
Date: Wed, 21 Oct 2026 12:37:32 -0300
Message-ID: <20261021153732.1978410-1-vinicius.eduardo.pedrosa@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <atjB-BnXclL3FcUm@ashevche-desk.local>
References: <cover.1792439398.git.vinicius.eduardo.pedrosa@gmail.com> <cc358c2be6b0b4ea0323e4f694a581ffb667112d.1792439398.git.vinicius.eduardo.pedrosa@gmail.com> <20261020104753.28703-1-vinicius.eduardo.pedrosa@gmail.com> <athe0QikG2mzCAtd@ashevche-desk.local> <20261021100049.16504-1-vinicius.eduardo.pedrosa@gmail.com> <atjB-BnXclL3FcUm@ashevche-desk.local>
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

Hi Andy,

On Wed, 21 Oct 2026, Andy Shevchenko wrote:

> Ah, dw8250_idle_*() are already BUSY-functionality aware. So, what we need
> is to provide dw8250_idlej_*() callbacks via struct dw8250_port_data and
> make current 8250_dw::dw8250_set_divisor() to be part of dwlib.
>
> Patch 1 (dwlib): Add callback definitions for dw8250_idle_*() to struct dw8250_port_data
> Patch 2 (dw): Assign new callbacks and use them in dw8250_set_divisor()
> Patch 3 (lpss): Introduce stubs and assign new callbacks to them
> Patch 4 (dwlib): Use dw8250_idle_*() in dw8250_set_divisor()
> Patch 5 (dw): Kill now duplicate code pieces
>
> Would it work?

Yes, I think the approach works. Two details from checking the call
paths.

dw8250_setup_port() is skipped for Octeon (skip_autocfg), so 8250_dw
would still have to install the setter from probe.

For LPSS, I wonder if the idle callbacks could simply be optional.
8250_dw would provide them and LPSS could leave them NULL, avoiding
stubs and a separate LPSS patch. The common setter in dwlib would use
them when present.

I'd still prefer to keep patch 1 as the small fix with the stable tag
and do the refactoring as a separate follow-up series. Would that work
for you?

I don't have LPSS hardware, but I can build-test the LPSS side.

Thanks,
Vinicius
