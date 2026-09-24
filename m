Received: from mail-wm2-f13.google.com (mail-wm2-f13.google.com [74.125.225.141])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 71E083E3D8C
	for <linux-sunxi@lists.linux.dev>; Thu, 24 Sep 2026 08:54:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.141
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790240044; cv=none; b=nUeob4m/sln5GIZgCd06G8/35altFj8vNXSFG5pnCxJDVgXVkL+vx3StACLQpyDD+r27nAqfe1EZI1R97wMeaGpjh/Cw7XB1+vczrR1BX/rfqcA+SbU1buJUAyxclnS7Lbx0kidjEJ9+R64PExKGStyiG6Lh3J7GJRLGSXktNoo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790240044; c=relaxed/simple;
	bh=vXsA8onEphTPMBeepzop7491JLND9beylCZQUYRa/9s=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=uXWfrktoKHlrOfhacfpsIZQdMAtszJiop6+XSIpAaGTaV+x8dSVbWP8RAXK8h3epAlA3VDSHz75/NS+5nFvum3oWHhMxm+x1DCmrIIRbdWKpI5ckeJd85dF8iyOgdS8Cy1lbGCXs4iybC5ZfhBTaVdZBAros0hk16mV12VSYsAw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.b=QFggiP9O; arc=none smtp.client-ip=74.125.225.141
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.b="QFggiP9O"
Received: by mail-wm2-f13.google.com with SMTP id 5b1f17b1804b1-49b912df756so13791255e9.3
        for <linux-sunxi@lists.linux.dev>; Thu, 24 Sep 2026 01:54:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1790240041; x=1790844841; darn=lists.linux.dev;
        h=content-type:mime-version:message-id:date:references:in-reply-to
         :subject:cc:to:from:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=YLnZwUG2MBgLZpqGTzUMzHxGyh6dXv6V+NePiVAKHBk=;
        b=QFggiP9O6wfy0cM+2zF5O8zt5GbwUJpRJuommoY6gUbTd+N6rvB/ahfwPV3FLECAjn
         tV9EU7yoFdGMP7GwZNJO4MeBkW2AtgvofHzReWF6kfkM1n++OiPo7deuypqrolAdI9BB
         MgCEyzqf8cPX1Jz8Yee02TOHBOogPYHDne73jKmj666XgllB+uPx6ECIYmxkA6QqsQf1
         ptPdhUJMG1vfm17LAWAvMVWiemcLWN9XTGeHadpedIz649KFEwtoN9GInNUVA7rtroPg
         JdaUAsAwcQ5IPn6GuHXG77yvLALXB3ZceBoRlSnW8t1bx6LK1+T5Z1IrtKX3lZEfJmKE
         xUJw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790240041; x=1790844841;
        h=content-type:mime-version:message-id:date:references:in-reply-to
         :subject:cc:to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=YLnZwUG2MBgLZpqGTzUMzHxGyh6dXv6V+NePiVAKHBk=;
        b=Zrh3cHquzBkyzRRskoiG6ZBXbo/13Ft6KVIFquDIFQY7JDZ/0RTtDufsCBbZ4rZKbS
         Q2hdWMGSq6/GnHL+sh2fti1xEUYP074OjnhC+MvRfo5m+MsDHpsSzo0Sf5diYfpXbbkV
         FuupFifkjoHVBHQ9CXc52PVy29nI3RwOlKl3k9oFsF7e2tv35AUUkVcuFI7pAPe5sf5g
         o/9kJa5U7fDHz8gFI+gh8REW6N1hNYRrXICQMilr0aI5XNbA51QvmZOglLvUVOKDCgTG
         IndCFPfJNthHwzd+B6TkvvD4iLRPhRqJCdUVdeKiIzHh8Ub8nqn9T8BFrHjh1kXUArkA
         brvA==
X-Forwarded-Encrypted: i=1; AKwUvBxlkAkpnNEwirfr1pwi/wIzi8clVSV4oiJNOa82oUCNH8upz/E45HzMaAw2jthKNo2/IX4JOQ3vZqVsDg==@lists.linux.dev
X-Gm-Message-State: AFuF++noujh8yF4S93JtW7oAGFUmJYWmDBfspkYmiitfqmYuOVdvHamD
	DoxFZorkXDzmqmfYgw120Gjnbv9gCD9/PZWrwbcb2+GJQInLzc4Q6+/+Od69EZu7pNs=
X-Gm-Gg: AYBFou2CEasi8+lhtV9JDKRF1jisOymMieKB79NB4Cgi8c28/plLcyUoLIykdiBPgsE
	SBIM6y5SsUiuaospF0i4GQH+tE8xZl0hfDZHeOck6NhFrBzdehichMKZsRTGusHSVk2AS82oKLE
	ad0UxeP7x85mBh6EzaZo0RYNuBM4H+g4E4IEQL+EQ25FewNGEWHnTsHHTbgpSHtJLB0UTAz5pqQ
	bBqo8ih3xi6C65vfE4GQUHJ5TZPDYKwYwSJaqd1oWP4/GkURup4vlnIxJMQkbkdkVYHjiFHAHc6
	pVZDCFV5LiRq0NlTUZFreuDVxLfIzXNgv/PqlpE9UfnPbgdbE0FLB7imfsMk2Sf1eIyjYxXbUdz
	SOiq/SvAGD06hlKsMCJvYn/qAS6XDNKA9RoqJHIXlHgIt1HGahU0ocreAlGgb1dBDuw2qcMqKNS
	TCrgXwruIoq3SXpcR9Y2WGfiHIGf2ULuj/YC6Nmi+5GdxnOK0RX4AnW0xOrKEe9C8p+77rASVpX
	GqGuIAqju0AjMQugg==
X-Received: by 2002:a05:600c:8b22:b0:49e:6fd2:a45 with SMTP id 5b1f17b1804b1-49fe66d81fbmr28966805e9.16.1790240040664;
        Thu, 24 Sep 2026 01:54:00 -0700 (PDT)
Received: from localhost (82-67-6-57.subs.proxad.net. [82.67.6.57])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49fe5cd4c8dsm64643045e9.3.2026.09.24.01.53.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 24 Sep 2026 01:54:00 -0700 (PDT)
From: Jerome Brunet <jbrunet@baylibre.com>
To: Andrew Lunn <andrew@lunn.ch>
Cc: Andrew Lunn <andrew+netdev@lunn.ch>, "David S. Miller"
 <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, Jakub Kicinski
 <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, Rob Herring
 <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Chen-Yu Tsai <wens@kernel.org>, Jernej Skrabec
 <jernej.skrabec@gmail.com>, Samuel Holland <samuel@sholland.org>, Richard
 Cochran <richardcochran@gmail.com>, Maxime Ripard <mripard@kernel.org>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, Alexandre Torgue
 <alexandre.torgue@foss.st.com>, Philipp Zabel <p.zabel@pengutronix.de>,
 Maxime Chevallier <maxime.chevallier@bootlin.com>, netdev@vger.kernel.org,
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-sunxi@lists.linux.dev, linux-kernel@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com, Andre Przywara
 <andre.przywara@arm.com>
Subject: Re: [PATCH net-next v3 3/5] net: stmmac: sun55i: Make the delay
 step configurable
In-Reply-To: <26334006-a2af-49d3-8f26-18cd44118c6b@lunn.ch>
References: <20260923-allwinner-a733-gmac-support-v3-0-15735155a789@baylibre.com>
 <20260923-allwinner-a733-gmac-support-v3-3-15735155a789@baylibre.com>
 <26334006-a2af-49d3-8f26-18cd44118c6b@lunn.ch>
Date: Thu, 24 Sep 2026 10:53:59 +0200
Message-ID: <1j4iff9gig.fsf@starbuckisacylon.baylibre.com>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain

On jeu. 24 sept. 2026 at 04:30, Andrew Lunn <andrew@lunn.ch> wrote:

>> +	 * Correcting them would break the DT ABI of the published DTs.
>> +	 */
>> +	.txdly_step_ps = 100,
>> +	.rxdly_step_ps = 100,
>
> Could you be a bit more specific about what published means?

DTs like those ones:
* https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/arch/arm64/boot/dts/allwinner/sun55i-a527-cubie-a5e.dts?h=v7.3-rc4#n88
* https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/arch/arm64/boot/dts/allwinner/sun55i-t527-avaota-a1.dts?h=v7.3-rc4#n87
* https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/arch/arm64/boot/dts/allwinner/sun55i-t527-orangepi-4a.dts?h=v7.3-rc4#n106

On A523/T527, only gmac1 is supported by the driver addressed in this
series. gmac0 is another (dwmac) driver.

If I take the 1st example

&gmac1 {
	phy-mode = "rgmii-id";
	phy-handle = <&ext_rgmii1_phy>;
	phy-supply = <&reg_cldo4>;

	tx-internal-delay-ps = <300>;
	rx-internal-delay-ps = <400>;

	status = "okay";
};

If the information we've got about the A523 delay steps are correct, the
actual values would be:
* tx: 540ps
* rx: 2120ps

So I suppose in this case, the phy-mode is more likely to be rgmii-txid,
isn't it ?

>
>       Andrew

-- 
Jerome
