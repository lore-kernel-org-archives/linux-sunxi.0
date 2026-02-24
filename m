Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9E3E03A0B22
	for <linux-sunxi@lists.linux.dev>; Tue, 24 Feb 2026 14:51:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771944690; cv=none; b=MEVN4DAAHF/hnikvqlvnF+VHdNpKh88kYnr3L/pSNg+NTtRenG/sYyXkV0mbs4B/PsT7da5VZO6fCKhNVz+ksEl9Y5dsIUQzYrdN7HT4otFwHV1oDJ2doldNBz+4PhPn/Gh+6YADqRyDTBhgadzWPEnFwLoalVpzh6sXsr3LKnY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771944690; c=relaxed/simple;
	bh=CTbG2+/qeKMz4OKAW8KVK98vi8Pu0f62GDaMHF9UJ9M=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=i8PSEjHmQO1SADmNtpikzFEJ6RbWMM97wPSkSgRtYjRN7UnUZF1VrjXzgVKaA99t5MVnKfN5R/4MDMmYRQaHx2hw2ERLc4Bf1a0tlg9HKoBIT9xMog/Wn2yZVNcAebBTX/ng6cbz4FJyB4pu2Vr2tvyBEoiQKShhPQykGmeVKl0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=b2nF0ina; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="b2nF0ina"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6C197C2BC86
	for <linux-sunxi@lists.linux.dev>; Tue, 24 Feb 2026 14:51:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1771944690;
	bh=CTbG2+/qeKMz4OKAW8KVK98vi8Pu0f62GDaMHF9UJ9M=;
	h=References:In-Reply-To:Reply-To:From:Date:Subject:To:Cc:From;
	b=b2nF0inaELbo3nIJYPqR0TbgFBJt/lH15X6b4kdV5yC8rKU7vy2fd496RTugBoT8V
	 Sz0ynyuyya0iXP0jVUoPM8YPf4UVW419FyyAdwhtZsAC0dMxQ7MaQq8oymc1wCjK7O
	 KIM+WMQ7RQ2iPcAGS9iaPjd1/Fb0B5UkgYRW1COtWU9omqpOKxkk3ww2tZLQUNhe6y
	 RMEB6UiySWUzOl5V+MhHhu2HtEwg0US1Yii98UlzmfTYdChrEZPk+wuaAv9f/oVJsR
	 BzpIPCgjOaLpNM9MS/P42JF5Iy7OV7AAp1MQTesdiCiN1E1wDFu3PUs/CHQuIPOtth
	 nerS28dEesGKg==
Received: by mail-lf1-f44.google.com with SMTP id 2adb3069b0e04-59f791a6e67so5521740e87.0
        for <linux-sunxi@lists.linux.dev>; Tue, 24 Feb 2026 06:51:30 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCXW2VWDRWbdsOGAm3NTIamG8YqVQE8mRDilMpBPTu972DiD+t1ySHah0zJY0Cqt/Nzw2YUJtRR/9rjExg==@lists.linux.dev
X-Gm-Message-State: AOJu0YxUhEl066NTns0EiuuQx29miDBWCmbo0pag2uEoRMlAuONb52H1
	ZM2gKD8escGF2JOKac247QYmub5YCWHPR/asqwU3e9RXSC3phY0qtV+kMtegQnsucPy1fvLV8kY
	iuaOvnSs/G5+Jfm9SwM011ifmRkTtVEQ=
X-Received: by 2002:a05:6512:3b11:b0:59f:6efc:2846 with SMTP id
 2adb3069b0e04-5a0fe4867dbmr67923e87.7.1771944688693; Tue, 24 Feb 2026
 06:51:28 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260205084037.3661261-1-nichen@iscas.ac.cn>
In-Reply-To: <20260205084037.3661261-1-nichen@iscas.ac.cn>
Reply-To: wens@kernel.org
From: Chen-Yu Tsai <wens@kernel.org>
Date: Tue, 24 Feb 2026 22:51:15 +0800
X-Gmail-Original-Message-ID: <CAGb2v67GbsYcHTtqhgPmV-aR+7MsGPAdEWUQgNnWF58QEJVprg@mail.gmail.com>
X-Gm-Features: AaiRm51nAh_B51su5XA5YdK2c0XNwTMbTicJtvmC3iQAXEKLeXb9nFKqg3c7k7Y
Message-ID: <CAGb2v67GbsYcHTtqhgPmV-aR+7MsGPAdEWUQgNnWF58QEJVprg@mail.gmail.com>
Subject: Re: [PATCH] clocksource/drivers/sun5i: Handle error returns from devm_reset_control_get_optional_exclusive()
To: Chen Ni <nichen@iscas.ac.cn>
Cc: daniel.lezcano@linaro.org, tglx@kernel.org, jernej.skrabec@gmail.com, 
	samuel@sholland.org, p.zabel@pengutronix.de, mripard@kernel.org, 
	mans@mansr.com, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Feb 5, 2026 at 4:42=E2=80=AFPM Chen Ni <nichen@iscas.ac.cn> wrote:
>
> The devm_reset_control_get_optional_exclusive() function may return an
> ERR_PTR in case of genuine reset control acquisition errors, not just
> NULL which indicates the legitimate absence of an optional reset.
>
> Add an IS_ERR() check after the call in sun5i_timer_probe(). On error,
> return the error code to ensure proper failure handling rather than
> proceeding with invalid pointers.
>
> Fixes: 7e5bac610d2f ("clocksource/drivers/sun5i: Convert to platform devi=
ce driver")
> Signed-off-by: Chen Ni <nichen@iscas.ac.cn>

Acked-by: Chen-Yu Tsai <wens@kernel.org>
