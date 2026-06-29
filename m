Received: from mail-out.m-online.net (mail-out.m-online.net [212.18.0.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 12E4336897E
	for <linux-sunxi@lists.linux.dev>; Mon, 29 Jun 2026 14:09:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=212.18.0.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782742148; cv=none; b=RqFRljdvPg4/Dg/vHqwbYpgyhIknafKEC3JFj1O/HxyKMrzz2LLoETNI7mZA1O22IWohF5NUlL26rtTmI0uip15AvL6i8aqh3jmq5eoLyyh8sBIyyNOTOaI9+utoFwfTGOjjaR3zLKSqEb2k1BkCEr84ics66KvASlP86k0UqVg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782742148; c=relaxed/simple;
	bh=g9dFPNs9RCiJ30PbQ83xQiLIkKE/aoKc7Ch+A3Ps5Fg=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=TvrUB2F1a0Loyn75Uzk3vj6vYHQKrvqWyIKwP235Jw++3lSyXwLrDCCSg9UwVG3hBQbNZD16T3vsby2ul4pynTudQT5a3C13Qa7wmR3Vi3stl/VAdZYPVYGWEdUtvoZify7K8VJWVZQR+KLHPdspVs2CAh2+zDnbLaoUN35Dh70=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=none smtp.mailfrom=linux-m68k.org; arc=none smtp.client-ip=212.18.0.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux-m68k.org
Received: from mail-out.m-online.net (mail-out.m-online.net [212.18.0.9])
	by mail-out.m-online.net (Postfix) with ESMTP id 4gpnxf56FLz1r5hc;
	Mon, 29 Jun 2026 16:01:10 +0200 (CEST)
Received: from frontend03.mail.m-online.net (unknown [192.168.6.182])
	by mail-out.m-online.net (Postfix) with ESMTP id 4gpnxc5SYXz1r5hL;
	Mon, 29 Jun 2026 16:01:08 +0200 (CEST)
Received: from localhost (dynscan3.mnet-online.de [192.168.6.87])
	by mail.m-online.net (Postfix) with ESMTP id 4gpnxb4V3wz1qqlS;
	Mon, 29 Jun 2026 16:01:07 +0200 (CEST)
X-Virus-Scanned: amavis at mnet-online.de
Received: from mail.mnet-online.de ([192.168.6.182])
 by localhost (dynscan3.mail.m-online.net [192.168.6.87]) (amavis, port 10024)
 with ESMTP id 0SnzNWDJyvXI; Mon, 29 Jun 2026 16:01:01 +0200 (CEST)
X-Auth-Info: MEDGnkGkok4HHiiAHx6Yp9YpyEe4vG/D2GYhM3WXSTA4/H/l6K4jcFYiosjPmxQG
Received: from hawking (unknown [80.255.5.134])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.mnet-online.de (Postfix) with ESMTPSA;
	Mon, 29 Jun 2026 16:01:01 +0200 (CEST)
From: Andreas Schwab <schwab@linux-m68k.org>
To: Arnd Bergmann <arnd@kernel.org>
Cc: linux-gpio@vger.kernel.org,  Arnd Bergmann <arnd@arndb.de>,  Bartosz
 Golaszewski <brgl@kernel.org>,  Andrew Lunn <andrew@lunn.ch>,  Sebastian
 Hesselbarth <sebastian.hesselbarth@gmail.com>,  Gregory Clement
 <gregory.clement@bootlin.com>,  Frank Li <Frank.Li@nxp.com>,  Robert
 Jarzmik <robert.jarzmik@free.fr>,  Krzysztof Kozlowski <krzk@kernel.org>,
  Greg Ungerer <gerg@linux-m68k.org>,  Thomas Bogendoerfer
 <tsbogend@alpha.franken.de>,  Hauke Mehrtens <hauke@hauke-m.de>,
  =?utf-8?Q?Rafa=C5=82_Mi=C5=82ecki?= <zajec5@gmail.com>,  Yoshinori Sato
 <ysato@users.sourceforge.jp>,
  John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>,  Linus Walleij
 <linusw@kernel.org>,  Dmitry Torokhov <dmitry.torokhov@gmail.com>,  Jakub
 Kicinski <kuba@kernel.org>,  Paolo Abeni <pabeni@redhat.com>,  Dominik
 Brodowski <linux@dominikbrodowski.net>,  linux-kernel@vger.kernel.org,
  linux-arm-kernel@lists.infradead.org,  linux-samsung-soc@vger.kernel.org,
  patches@opensource.cirrus.com,  linux-m68k@lists.linux-m68k.org,
  linux-mips@vger.kernel.org,  linux-sh@vger.kernel.org,
  linux-input@vger.kernel.org,  linux-media@vger.kernel.org,
  netdev@vger.kernel.org,  linux-sunxi@lists.linux.dev,
  linux-phy@lists.infradead.org,  linux-rockchip@lists.infradead.org,
  linux-sound@vger.kernel.org
Subject: Re: [PATCH 00/13] treewide: replace linux/gpio.h
In-Reply-To: <20260629132633.1300009-1-arnd@kernel.org> (Arnd Bergmann's
	message of "Mon, 29 Jun 2026 15:26:20 +0200")
References: <20260629132633.1300009-1-arnd@kernel.org>
Date: Mon, 29 Jun 2026 16:01:00 +0200
Message-ID: <mvmik71win7.fsf@suse.de>
User-Agent: Gnus/5.13 (Gnus v5.13)
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain

On Jun 29 2026, Arnd Bergmann wrote:

> From: Arnd Bergmann <arnd@arndb.de>
>
> The linux/gpio.h header used to be the global definition for the gpio
> interfaces, with 1100 users back in linux-3.17. In linux-7.2, only about
> 130 of those remain, so this series cleans out the rest.
>
> In each subsystem, we can replace the header either with
> linux/gpio/consumer.h for users of the modern gpio descriptor interface,

A few of them already used <linux/gpio/consumer.h>, and is duplicated
now.

-- 
Andreas Schwab, schwab@linux-m68k.org
GPG Key fingerprint = 7578 EB47 D4E5 4D69 2510  2552 DF73 E780 A9DA AEC1
"And now for something completely different."
