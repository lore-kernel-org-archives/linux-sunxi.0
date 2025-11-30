Received: from mail-lj1-f174.google.com (mail-lj1-f174.google.com [209.85.208.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 09640241665
	for <linux-sunxi@lists.linux.dev>; Sun, 30 Nov 2025 22:09:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764540562; cv=none; b=ZiMHj3wtFtUiwxcwmQxROc1xLIYDW0+h3pGdJ5HfP68t8XjTohLWtC9ZBP42jdxAxq2Mh5UL26dUs7YR91wVt8yf1GfElWYl8VXqbO+4tMQ7MFxr/mD9wfVP9yeyTRzDpI8If09UtO2roPn7nksUJGNADqdtZBUqX6SNGe99Am0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764540562; c=relaxed/simple;
	bh=Ak72vqUqWD7TEZGLUkmoCCSls8wg/A8pKt5EEXR/6Eo=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=gGTF0G0X4VtW+yQou1qM4FfcWN6hxVWzmukgBKRrd4f7wfteXehuNTiORVTU9Rg9SuWtnITQbHdMROYc+mHcab4BJ0x53A2qOOLOvjMUPH6s0rGMQJk46Dvj3FsuQSus24r7VeZdLTW1KJ7QMbMHMeyI2g86Hs1KocA5NxoxdzQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=PaswecQ+; arc=none smtp.client-ip=209.85.208.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="PaswecQ+"
Received: by mail-lj1-f174.google.com with SMTP id 38308e7fff4ca-37a33b06028so32531071fa.2
        for <linux-sunxi@lists.linux.dev>; Sun, 30 Nov 2025 14:09:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1764540559; x=1765145359; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Ak72vqUqWD7TEZGLUkmoCCSls8wg/A8pKt5EEXR/6Eo=;
        b=PaswecQ+tYoRN15ircN4Bsb3dzwgwhwkikfW9/Erzplh/bI1/M9EDBS1SL3bKM4AEt
         U/ZBH8Vff9/xTqwBeDAv/JiF71BuIFpsowDH60gN4COxJ5PXqqCdUmBN5iqryM1tw6Iy
         wWGWZPYvuNBi6A/gqC8Z44yyf6BVLTqE8tUOu60RwL+GY8kzYLIEP8/LKSIKgNbG9cLX
         6eQBt2UAt91mgBzx/91v9US4QGswvcuTjyCJ8RoL8RSNt/3g6+OpUrLyBZdri2KXJedi
         FEvZHYpeX8SAjKn74C7iwiuzTE/vF84hI3oXLb6T+P4Tz5RBU+pOxqGOc39zkQ3Bo30e
         0kpQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764540559; x=1765145359;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=Ak72vqUqWD7TEZGLUkmoCCSls8wg/A8pKt5EEXR/6Eo=;
        b=LkSEsIfuJnioanub5l0w1vm+4iJvfyZi2vg47t7xHQ7tzMfEbzPbiEQZQap/WXVIkz
         FW4G50x0JvBcLhZbVtC/nJMijl1I6KzhkGASy7RcswNpMkyLD/HT6DbHqilcUMhVD3dT
         1jEms79zx0vWUSDzFDqwQgKJsJfsiRO7lv0TalMw1aT8BnaKjjakbJQKXz/RAM+y3DgB
         rFsaE1PVowj0TtJXzqSROOxjMg2j9J26uhfmaRTYDg/KKsa8fxWT0kGtdEORWc7vu9D1
         vlmPOB1NAhb0EJeaYJi9JXBDaoGjUNfmpkomx3gDubuC1FbNbOdkfgUQhRRyQ+vHyUpZ
         cArw==
X-Forwarded-Encrypted: i=1; AJvYcCVb0GncZSk6qqk0b4BCqU2D8tUHTxsMaYrOw7pmPxETh6YoSe2hPaNXkh6953dhp3oWdhib+ejQsF0/cQ==@lists.linux.dev
X-Gm-Message-State: AOJu0Yw0y9+zR1PkBU0iWkCfEBwpBMAK1FA+EODsIPgMkt+fOh/EQ0g9
	FcuhsxN3oSPoEuSBDhlVfRf8aO/GEcFAukzsVRroXciddqP+0/RzkyeMVqqK6K7FHExROol72PH
	wIrNjxZOUDyrpqIOKFS8n4t8aO57leAs=
X-Gm-Gg: ASbGncuFu8iWmOcnBtY6Y0HT321PQR1wVajZVXazdJl7ZoQ/Z0vRVvC0+ikIQDJ9lNZ
	6feXuGuPIFa2GV6k8L6SxzvBJyVS5hBkKPbWCRXd6hrw398lIjS9BF0DW9FO48QJKALoohK033Y
	if2mH2fCBYjqo72mjjbWkaj6nWgDyOGXOG41xa08xqOcjcC2DQ2z2SqpgMOYfKWOrP6u5xQwnHh
	btyaClDt3gg0Tlv3HaIx3ea9Z6GUGbjc11UVkjAdve8xF+uj6b/CUsQ1I3x6mD0SzkFL+wOAk9r
	B9iJ56uIPXWT/n0+3L5ADAuRI4E=
X-Google-Smtp-Source: AGHT+IEOJcVzq3wJFIH6Qt3VxQ+yrDjwFeeidoppkOQjRoH5ZW2FpUGTT6qw4zk+iCsig3Q4kCWlua5+WpZqK+xwdPU=
X-Received: by 2002:a05:6512:3d10:b0:595:831d:2308 with SMTP id
 2adb3069b0e04-596b4e5298amr8623531e87.1.1764540558808; Sun, 30 Nov 2025
 14:09:18 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20251130-01-a733-soc-support-v2-0-18bdd4376fad@gentoo.org> <20251130-01-a733-soc-support-v2-6-18bdd4376fad@gentoo.org>
In-Reply-To: <20251130-01-a733-soc-support-v2-6-18bdd4376fad@gentoo.org>
From: Fabio Estevam <festevam@gmail.com>
Date: Sun, 30 Nov 2025 19:09:07 -0300
X-Gm-Features: AWmQ_bnHvrE5VvClEN731IF4cEfOYkHQKOOLCbxqUd6JrTcAyOXhC5-bZ7cqewk
Message-ID: <CAOMZO5BG63ndAg7yTdMtBi7nHQjCGcrS9Sr0M5XfAiBkrC-oAA@mail.gmail.com>
Subject: Re: [PATCH v2 06/10] gpio: a733: add initial support
To: Yixun Lan <dlan@gentoo.org>
Cc: u-boot@lists.denx.de, linux-sunxi@lists.linux.dev, 
	Andre Przywara <andre.przywara@arm.com>, Jagan Teki <jagan@amarulasolutions.com>, 
	Tom Rini <trini@konsulko.com>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
	Paul Kocialkowski <contact@paulk.fr>, Samuel Holland <samuel@sholland.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sun, Nov 30, 2025 at 6:47=E2=80=AFPM Yixun Lan <dlan@gentoo.org> wrote:

> +config SUNXI_NEW2_PINCTRL

This name is not very descriptive.

What about SUNXI_A733_PINCTRL?
