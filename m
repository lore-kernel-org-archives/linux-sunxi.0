Received: from mail-ej1-f43.google.com (mail-ej1-f43.google.com [209.85.218.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2B3D6257831
	for <linux-sunxi@lists.linux.dev>; Wed,  8 Oct 2025 16:58:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759942708; cv=none; b=hfEoeK9xUW+ER+8X1CJkLep8euw/KIo5zHNAhf+WJ5MiPZJQ20P9bklWl1gXEe51xslCav5arUUCTyvfH2pBKNPme2SWHFyXDVEggCihqBBohsdIEWpSKX7KD9tdm0YUXVH0DN+mG2DbCU1DgfvU7MFOOfhXfcwovZIwN66YdL0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759942708; c=relaxed/simple;
	bh=IjbFp+AAJ0GPQMOTx6ZjwxXhALOLADjgQf3T5Jpj/T4=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=EOaAyWRzONWsj7vEra6hYh6xEkxquWcNRuhDS8CvfNP1OQaIFqnkIvFcZDbWBgB6dCKwk/6B4dENYpXaSyRhGBhImQ7at8ZtVdFpIhJvpNdr9CNeqFBZ7PX3VmBk95Elt1bXykT7opi2rh8c733BNOVVuB5cXClm28gpdCgh9R8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=jcqyPMe5; arc=none smtp.client-ip=209.85.218.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="jcqyPMe5"
Received: by mail-ej1-f43.google.com with SMTP id a640c23a62f3a-b3ee18913c0so3911866b.3
        for <linux-sunxi@lists.linux.dev>; Wed, 08 Oct 2025 09:58:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1759942705; x=1760547505; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=IjbFp+AAJ0GPQMOTx6ZjwxXhALOLADjgQf3T5Jpj/T4=;
        b=jcqyPMe53dGTqrUtnHumDRwpM/b1KMSTXX6okikAlHLyhnKMVrqZcvDLdv776PKtds
         mx4kxvj8dVXmgoUw33WeiuW7Hy7MJbi/XJuL1ZoMtk4NOj02aXLA8oCklnc1CJ8ACcZp
         kVb94Z317bS+X4p5/+xSO+UgifFP1Xo87OmiBapA5Vqa7KiA4/VxL83+8fFqxQ/eT1XC
         HSMSW5qQXAbwK3xyfqEkNRXJi3v96TJ1sCOMN9ZEYnauhgPWfhByR0SS61Iwf7/e5egp
         562IzcvXbzNYgs/L+FhQkkB1eQsnDKEqm2uT2T6V1oHhLAR/WN6MAQeJctiMaGNLQT8X
         mQQA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759942705; x=1760547505;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=IjbFp+AAJ0GPQMOTx6ZjwxXhALOLADjgQf3T5Jpj/T4=;
        b=WdVCU7Yw7JVR493zFn/pWb962uldqCnOt8GssO8p1vQlHoBHZz9KvW+6YP6z2Miete
         IH9y2j5Jczx0x9w+7Dwb1Yfb/wAs2j9aYlcUhP11VMoSwnjp7JVXoeF2lQrNUi647IYV
         qc/dsv4p5RVNV6kcM5oZRoePLQzVWxn2wVkaOHrRUPpdnKgpLXLAXXEp97f7s752LRnS
         5UezbqoihiTEgwW7mUneCG1RRMcnjWW0sJmXz4+JENL8zms/aQlRg+CFg1plG1JJoixS
         tUVV1HHoLddLdzJuyma67jE65gQ/S4xm4+JHHRfk0iI8AJUso5CHQ3S89q+BfqX2Iwyv
         wtVA==
X-Forwarded-Encrypted: i=1; AJvYcCX5qXt0+bw1xlWTzDRIkNFZs6uqkeylv+H8sSzua4Jhqvcu0/MJw9MqtHg/lQ9hIzQleI7Drqvrc7n9mw==@lists.linux.dev
X-Gm-Message-State: AOJu0YwQlyma8Dop7gAYOlQHtC7ETv3BILyUcrOoV9pkEPDDiBA59RTT
	ehVu/t6cIA2UrbcwRh/BEcK8McMlxd0qAyzNrBzVx8rBtC6nVb9vh5vrAWi9Mo0bhv8XTScpPrO
	THwnCAOtApy4SGrOchrkzBc5Vnpq3cJk=
X-Gm-Gg: ASbGnct6Iw63Exfcbvsv1CYzMY7IeKKgVZeTSkLW5vgFP2vcs2gADNeY5CYtzabUEkW
	zITKQcOwFQmVmLcwWX+lM++k1FkDqUImpSR733Paba1jm78ksg/v/Bhle+BG5eSIBSOzbpN/tva
	BHMZBiS4Hog9FjKRdF8/94sZsbFJ3/+X/xK79HzJ2VYOzpEVP6Sr0gf8mwWTO9p7kLSn56udWqg
	L5lrAnZ/p4NVzRYHxsK0RmD+VtgpLw=
X-Google-Smtp-Source: AGHT+IFM8B+yRjNiQWgGuDgYf4XUl4H+hx1IOIfC8pC6J7gmFamfZw32Vs0iDE5FnPT00Hq1ICxP2bzhEgGRBLspIeY=
X-Received: by 2002:a17:907:7213:b0:b47:c1d9:51c9 with SMTP id
 a640c23a62f3a-b50ac4d3a5fmr452540666b.62.1759942705378; Wed, 08 Oct 2025
 09:58:25 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <aOaWpVGZSCY6kN-6@homelab>
In-Reply-To: <aOaWpVGZSCY6kN-6@homelab>
From: Andy Shevchenko <andy.shevchenko@gmail.com>
Date: Wed, 8 Oct 2025 19:57:47 +0300
X-Gm-Features: AS18NWCT0X_F7IZWKb87X-14WoCCTqsfTJlR0tHQft1sveRDBANcDJ27fz9ygt4
Message-ID: <CAHp75VdKLoCyYHZsEpkmXNJQ5QSpA_crrWR+MS4-=xmn=g9azw@mail.gmail.com>
Subject: Re: [PATCH] iio: adc: Fix pm runtime clean-up in sun4i_gpadc_probe
To: Shuhao Fu <sfual@cse.ust.hk>
Cc: Jonathan Cameron <jic23@kernel.org>, Chen-Yu Tsai <wens@csie.org>, 
	Jernej Skrabec <jernej.skrabec@gmail.com>, Samuel Holland <samuel@sholland.org>, 
	David Lechner <dlechner@baylibre.com>, =?UTF-8?B?TnVubyBTw6E=?= <nuno.sa@analog.com>, 
	Andy Shevchenko <andy@kernel.org>, linux-iio@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Oct 8, 2025 at 7:52=E2=80=AFPM Shuhao Fu <sfual@cse.ust.hk> wrote:
>
> In `sun4i_gpadc_probe`, in case of thermal register failure, the runtime
> PM usage counter would not be decreased, resulting in a possible
> inconsistency of runtime PM state.
>
> Fixes: b0a242894f11 ("iio: adc: sun4i-gpadc-iio: register in the thermal =
after registering in pm")

This might fix this problem, but it doesn't fix the whole mess in the
probe with devm/non-devm ordering.

--=20
With Best Regards,
Andy Shevchenko
