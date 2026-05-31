Received: from d218-8.smtp-out.eu-west-2.amazonses.com (d218-8.smtp-out.eu-west-2.amazonses.com [23.249.218.8])
	(using TLSv1.2 with cipher AES128-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2C5A8345CBC
	for <linux-sunxi@lists.linux.dev>; Sun, 31 May 2026 10:18:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=23.249.218.8
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780222683; cv=none; b=ugX8DbRAIDlH8ELnVAFGzNIEvtbzE8XOCXB17rqhP755unWD/OhlzRPeKvFG6RDtzFp5UdyvB7+pihWzAaYaslDoCfbQ6Mgq+w+5O8LE0IEmax2Ox6WUYV5HtShs4hd9uB35kNGaZnsYqkWyFLzgafE9Wb+Hju9T5BynUc+P0ig=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780222683; c=relaxed/simple;
	bh=4xuv784QuJ7ur67NeDEqyjYS0Da3u+bMMggiLyupPQ8=;
	h=Date:From:To:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=Qkpt4TTrSXRDrKD6MjigrNmVPA/xd5HpecL6L+y2T3lzrsE4zvjgQQbgr12ivssAmFyybxd6BGuuC97wNGwZHxQXVLuire/d6gmYUwAGVBFs1uxE7kdWSkjcxeD3f3hywQ3zQe7XhENsHrcD5E2y2d7avq4Lp5/rxmTSKYfeqiA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=electricworry.net; spf=pass smtp.mailfrom=mail.electricworry.net; dkim=pass (2048-bit key) header.d=electricworry.net header.i=@electricworry.net header.b=YrdjZFlK; dkim=pass (1024-bit key) header.d=amazonses.com header.i=@amazonses.com header.b=oYVsk+Rj; arc=none smtp.client-ip=23.249.218.8
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=electricworry.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mail.electricworry.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=electricworry.net header.i=@electricworry.net header.b="YrdjZFlK";
	dkim=pass (1024-bit key) header.d=amazonses.com header.i=@amazonses.com header.b="oYVsk+Rj"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=xxcsvipqs5hvfd7f74n2i5bueyncqkjk; d=electricworry.net;
	t=1780222680;
	h=Date:From:To:Subject:Message-ID:MIME-Version:Content-Type;
	bh=4xuv784QuJ7ur67NeDEqyjYS0Da3u+bMMggiLyupPQ8=;
	b=YrdjZFlKMNTtZfE3YvxInJGUIuqoZj2ibapJ2luZuTaEd/JdaH+cJzWet/ascRxS
	6pW+TUuSQRqjDqAqs/XJlIV6PdSMQR+ySOYIyewiMzonTxPtyCzCHuny5LTp2yRWOLK
	nwoABlONlUD2IzI2uYeLdn2Iz0aPi6dew42FkFqPcWwldyBYgphI4fQYHoPr076/8vm
	G6aILf3RFRz683aUcgAy5w8b5awkB1FMQk7mHrTPfZTHd+0aDIdna5tfVgW6xUyqUbr
	7SsNGRGj3UQnNp+1cqbpyw3+NmqxVkKLAikfRHsTcB2AxbV/pUVLVNYe6KOrOzNZ5fa
	6o+XS2cH/A==
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=smjs5bczbyxi6u2ua6eveuxqal7joyry; d=amazonses.com; t=1780222680;
	h=Date:From:To:Subject:Message-ID:MIME-Version:Content-Type:Feedback-ID;
	bh=4xuv784QuJ7ur67NeDEqyjYS0Da3u+bMMggiLyupPQ8=;
	b=oYVsk+RjwxML6m2H+f9kuBYF4jJfgEQF9OLVNy2qpYAgzj7FC/rOfP1fJwhks6Jf
	z2eS6pasnxVZciVnBbAXhUgiLPozARgnMOIAflM0auK4eg/Jsb8lceg+TzJ5Zu2Rw/M
	Z3KHBcuY0hRjv9O10vQCHGuZS46+jbAdxGkpN60c=
Date: Sun, 31 May 2026 10:18:00 +0000
From: Bob McChesney <bob@electricworry.net>
To: linux-sunxi@lists.linux.dev
Subject: H616: dw-hdmi and HDMI_FC_INVIDCONF_HDCP_KEEPOUT_ACTIVE
Message-ID: <010b019e7d8a5d77-66007852-7f5f-4bff-be1d-6058f6ae98bb-000000@eu-west-2.amazonses.com>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Feedback-ID: ::1.eu-west-2.gfFyncE+PRqcG/qebM3Lg+wfopUKzk5aGDEiDVENH+o=:AmazonSES
X-SES-Outgoing: 2026.05.31-23.249.218.8

I'm trying to understand what the HDMI_FC_INVIDCONF_HDCP_KEEPOUT_ACTIVE
bit of HDMI_FC_INVIDCONF does with respect of syncing with what might be
a badly behaving HDMI sink.

I've observed when an Orange Pi Zero 3 is connected to my Samsung TV
that the TV does not recognise any video output in the first 15 seconds
after the kernel has started. However if I force setting the HDCP
Keepout register to Active then in repeated tests the TV displays the
output after 3 seconds of the kernel starting. So I am trying to discern
whether my TV is just a badly behaving one or if there are improvements
to be made on the driver.

In linux/drivers/gpu/drm/bridge/synopsys/dw-hdmi.c:
    inv_val = (hdmi->hdmi_data.hdcp_enable ||
           (dw_hdmi_support_scdc(hdmi, display) &&
            (vmode->mtmdsclock > HDMI14_MAX_TMDSCLK ||
             hdmi_info->scdc.scrambling.low_rates)) ?
        HDMI_FC_INVIDCONF_HDCP_KEEPOUT_ACTIVE :
        HDMI_FC_INVIDCONF_HDCP_KEEPOUT_INACTIVE);

This feature will be enabled if either of the following conditions are
true:

1. hdmi->hdmi_data.hdcp_enable
2. (HDMI IP version > 0x200a) && (DDC bus is present) &&
   (sink supports SCDC) &&
   (sink supports low scrambling rates ||
     (sink max TMDS clock > 340000 && clock rate > 340000) )

2 is never true because my sink doesn't have the HDMIForum VSDB (and
even if it did, the Max TMDS clock is 300MHz), meaning that according to
HDMI Spec TMDS scrambling should not be enabled. Therefore, according to
the driver, the only other valid reason to activate this feature is if
hdcp_enable is true and nothing ever sets this to true.

Since support for HDCP is not indicated via EDID but via communicating
with other addresses over E-DDC, I presume that by activating this
feature the HDMI IP is discovering HDCP features over I2C and enabling
HDCP. Unfortunately I do not have an HDMI Analyser and I do not have an
I2C sniffer (though I am waiting on a Raspberry Pi Pico arriving so that
I can sniff the I2C traffic).

Do you think there's work I could be doing here to improve this driver
or am I just dealing with a badly behaving TV that should be more
graceful in its acceptance of legitimate unencrypted traffic? There have
been no issues observed connecting to my HDMI monitor and a DVI test
screen I use. Apologies for any incorrect statements I may have made;
the DesignWare documentation I have is taciturn on this feature.

Regards,
Bob
