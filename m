Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795539371;
	b=r9LMSRz9HgbIN0C+vRJKztFmFx/B5GXfNj7tM4sJgK2cyLd65Th7FgoN2tmsIZhwNWk3
	 GjL7v4D/4IJ7ZlgjRHrzprOPhB33xWRp2TCT9jvCX61zZU1FsqPz/lFKnzrA8z9Zrnsdo
	 BmWgjd/Et8+GBeZCnaXhpFvbfWXkZvcZ71URLoTeYl4G10K7T270xqKC7nC9oMxcq9jBy
	 7RnCr8voNFLKo5XpPDbeJqp3KnmESYBjhA7um5FnLilzvJmt4mHIURJDtqx0f3C/1FqOk
	 OcB0hUn17274T56bcfYJw5a73fy4ieewXJDYZVEgfj482tczljMMJRAwpjBIgh5WwDg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795539371;
	h=Received:DKIM-Signature:From:To:Cc:In-Reply-To:References:Subject:
	 Message-Id:Date:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 X-Mailer;
	bh=Kc+MsIabW6WcmNl/5p3XK4QyfJDUGsoZYSI+Sqn9zFU=;
	b=mXISuJIFQUThHQxVYL78OoeosUJU52hHoqNgLAd8k2VcsOC3IbICW/3bDzhPBx6+S5ty
	 LUCXOdaQ4pUgAX5UourQbY2LuRWFAJ/0lG9Xzp5raYmlSPw6Y1OQhVFVPDo0jgL17/lyc
	 UW77z2+7USlEnW50Ayt0O5SZMzPCphtQ+cFstOvtda7MRaWm0mNzWFS3HrHTWSPf67h/4
	 wHdfa9m4mTCQ3yqDH5Q5M2AFwtP+KR7Nzti1VD5GtLstRVLNj24RGcAulTPtvhKBeD6N4
	 5Vxb0tHVyo2+TFUtQaw7PPfd69cyCXyWdMc17dxA1eRbw8NOY9xKBuRuOlqbeogumpw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=gFIu1mqL;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CA2BE606A332;
	Tue, 24 Nov 2026 16:56:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=gFIu1mqL
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5D44B1F000D1;
	Tue, 24 Nov 2026 16:56:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795539371;
	bh=Kc+MsIabW6WcmNl/5p3XK4QyfJDUGsoZYSI+Sqn9zFU=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date;
	b=gFIu1mqL9tR1VODH784DTiaGPaFCbwXsoXycD5emKdRiztplmbg6SJBeesiwZlydn
	 eIz3kJv4CnRq/JSUHrhe3Qn5rT0KEzTcGuv6+oJU4kIyjxPkJOM7mvDsecZlKcGjai
	 rTGPVUzpSSHoy2veLByX4mjmAWaIIGYhTQTdrMx1/zlg1SNXvQJaGC/6zVgk/a6avq
	 03aM3EjN+AbMnrV87q/3qtEWF/pzcq1g9t2+h4O2S7JFezzcSMxJCDKcICQ1tpJdtl
	 EV+s98Kcn+x1oHOOS86xOeAjDHGEWQD6XJb8J6tK/wlVU9oLXMv2gXPiJHCczGo542
	 6bTHghM6WMHQw==
From: Chen-Yu Tsai <wens@kernel.org>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Samuel Holland <samuel@sholland.org>, Jun Yan <jerrysteve1101@gmail.com>
Cc: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-sunxi@lists.linux.dev, linux-kernel@vger.kernel.org
In-Reply-To: <20261117142122.246986-1-jerrysteve1101@gmail.com>
References: <20261117142122.246986-1-jerrysteve1101@gmail.com>
Subject: Re: [PATCH] arm64: dts: allwinner: h6: taiqicat-a01: Enable
 Ethernet
Message-Id: <179553936914.1403078.2425862888304539026.b4-ty@kernel.org>
Date: Wed, 25 Nov 2026 00:56:09 +0800
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Post: <mailto:linux-sunxi@lists.linux.dev>
List-Help: <mailto:linux-sunxi+help@lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
List-Owner: <mailto:linux-sunxi+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.14.2

On Tue, 17 Nov 2026 22:21:21 +0800, Jun Yan wrote:
> The TaiqiCat A01 has a 100 Mbit/s Ethernet port, which uses the EPHY
> integrated into the co-packaged AC200 of the Allwinner H6 SoC.
> 
> The AC200 derives its 24 MHz reference clock from PWM1, so enable the
> PWM controller and the pwm-clock node that supplies it. Also enable
> I2C3, over which the AC200 is accessed, and describe the AC200 EPHY
> package on the EMAC MDIO bus, with the EMAC operating in RMII mode.
> 
> [...]

Applied to sunxi/dt-for-7.5 in sunxi, thanks!

[1/1] arm64: dts: allwinner: h6: taiqicat-a01: Enable Ethernet
      https://git.kernel.org/sunxi/linux/c/caf2ffc9985a

Best regards,
-- 
Chen-Yu Tsai <wens@kernel.org>

