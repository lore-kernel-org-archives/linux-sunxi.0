Received: from mail-lj1-f171.google.com (mail-lj1-f171.google.com [209.85.208.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C7278158557
	for <linux-sunxi@lists.linux.dev>; Fri, 27 Sep 2024 06:36:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727419016; cv=none; b=NbU7ugpP2YsXlauJ14cgRfY5KfsoMLUmDPL7MPXpD6kjRQ4poDjdxGSeCPYYZSyIRaAIZ7sMRyud8aO0MqS/h8w9eeb93+fGS+yBuAS7v4qzq+U2MZd1cG5wnVFrXiQrHeSwBVMPF3S/2zWVjprYH8AArwkSjupoPUCvxuH+5ik=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727419016; c=relaxed/simple;
	bh=vXRBt6+WPBCXEvFEojsG0JdYGPjOPLdAL5vKh0gVANs=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=gQXIQjz/aVq3mKBjvuPTuyef8Izqz/awlrtOhs6BSvoVzbBoafZqfwXPFBNdmKIevxGgkUo7MntzvcrMSlBYhfG4k8KshjvpH/J750s1H5kllDgRAVjOqoPwszh67N5+iNOZEEdawofckNeEkeQlaM1GWRsrBmwscfldzFwl058=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=M6ylcKp6; arc=none smtp.client-ip=209.85.208.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="M6ylcKp6"
Received: by mail-lj1-f171.google.com with SMTP id 38308e7fff4ca-2f7529203ddso28414101fa.0
        for <linux-sunxi@lists.linux.dev>; Thu, 26 Sep 2024 23:36:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1727419013; x=1728023813; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=vXRBt6+WPBCXEvFEojsG0JdYGPjOPLdAL5vKh0gVANs=;
        b=M6ylcKp6oDqvWsLNAJUI4suKwc/RrIg1yjbebaBV5yhRw2+u791vrldPLe4Mhbx82Z
         1e2pZtMAieAKLMb2gltclTczkBaIC2gPckz66XkBDqu/3eA+lf06ZQ1Ri7btJ7eyfF6t
         BqInrNZ+IbFOLZSXi8MMFAlOCha3Aal2EVsNHSRYlbJDp1hxeziOmLMQ3+zUt3kVB3Hm
         /ZzWNyzl4iS7JlLuC+6IIpbkh/D1uBEKBaN5t9xf1VBvPfipgM6d432f87QRoebX28ts
         AtDRaaifiYZ9Wy/Ni2t+v0ffZNPXGjblWTcftxIj5lTg9VZhZSkhjhuj1s6Z+GLdI+4P
         AsMA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1727419013; x=1728023813;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=vXRBt6+WPBCXEvFEojsG0JdYGPjOPLdAL5vKh0gVANs=;
        b=DLo1KrkxFDq2DQNiecLqWNptBxwsepZp3lZpElvD+Sp9mEM6xJOjA73gwZvT0cEO44
         xac93wwe2+0Rp5zewKlpiAQ2G/Odv7TyVzW3LbnR/Rr+0atxnfFBeA1KdyC5Ud6sXSdF
         rwPUeuDl2Jr6ejrED6WiLTvoQ1X4XOv3BWu+O6qBmJeXC4JTZE6H1qRcAohIl6AVJRnx
         QPAwLRpNpCCFgzj++Xr1YAlK/3z4joHOg5tXe+SnJ/Z86+NVpIN6tSGc8RnGt+Yj8z4N
         /GD1wNjzEkxkKJjWlyFOY4JvS52es62q6qBl789Cy7xXHf0QpXMupa4RVFBOpyRrUEX+
         d9Fg==
X-Forwarded-Encrypted: i=1; AJvYcCV7tcZ+6wWOyKuz0jOUYssuU1sndj3TIR/YtemY40Kr+x+NSOXcjARSXx1qhqSav2Dzdyl76LTO/HrB7Q==@lists.linux.dev
X-Gm-Message-State: AOJu0YzDMnVhJVL4MJITngypB3pmS6H8So0572+EWyuCdhuivHEaHL4U
	7gjf3OD/q0mX25N528dZQ2b5kKErGcD0GwOgIfbHYDwjw7w0NRwjimioqk7NZan7UtuVwi/+/jv
	KXiinG2c51EtrtvJzK8IP9JKxf6TtmEOauynoFg==
X-Google-Smtp-Source: AGHT+IGgFYfXHCal2e51gzgszcfItBm9C194Qyz5q41DI00iOJq9PeBaLsT1ymvZJa7VwGDM3d1wVm/E+xtj8hsF0w8=
X-Received: by 2002:a2e:84a:0:b0:2f4:3de7:ac48 with SMTP id
 38308e7fff4ca-2f9d33928c1mr6048771fa.19.1727419012116; Thu, 26 Sep 2024
 23:36:52 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20240927-leds_device_for_each_child_node_scoped-v1-0-95c0614b38c8@gmail.com>
 <20240927-leds_device_for_each_child_node_scoped-v1-11-95c0614b38c8@gmail.com>
In-Reply-To: <20240927-leds_device_for_each_child_node_scoped-v1-11-95c0614b38c8@gmail.com>
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Fri, 27 Sep 2024 08:36:40 +0200
Message-ID: <CAMRc=MeXxeXq4m4nvb+P2ZQuYbQ18n4572cwkkHG+=U7nfa7Vw@mail.gmail.com>
Subject: Re: [PATCH 11/18] leds: max77650: switch to device_for_each_child_node_scoped()
To: Javier Carrasco <javier.carrasco.cruz@gmail.com>
Cc: Pavel Machek <pavel@ucw.cz>, Lee Jones <lee@kernel.org>, 
	Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, Gene Chen <gene_chen@richtek.com>, 
	Jacek Anaszewski <jacek.anaszewski@gmail.com>, Chen-Yu Tsai <wens@csie.org>, 
	Jernej Skrabec <jernej.skrabec@gmail.com>, Samuel Holland <samuel@sholland.org>, 
	Jonathan Cameron <Jonathan.Cameron@huawei.com>, linux-leds@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-mediatek@lists.infradead.org, linux-sunxi@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Sep 27, 2024 at 1:21=E2=80=AFAM Javier Carrasco
<javier.carrasco.cruz@gmail.com> wrote:
>
> Switch to device_for_each_child_node_scoped() to simplify the code by
> removing the need for calls to fwnode_handle_put() in the error paths.
>
> This also prevents possible memory leaks if new error paths are added
> without the required call to fwnode_handle_put().
>
> After switching to the scoped variant, there is no longer need for a
> jump to 'err_node_out', as an immediate return is possible.
>
> Signed-off-by: Javier Carrasco <javier.carrasco.cruz@gmail.com>
> ---

Acked-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
